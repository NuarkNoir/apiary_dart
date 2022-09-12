import 'dart:io';

import 'package:apiary_dart/parser/token_type.dart';
import 'package:apiary_dart/utils/optional_of.dart';

import '../entities/boat_entity.dart';
import '../entities/plane_entity.dart';
import '../entities/train_entity.dart';
import '../parser/token.dart';
import '../vm/vm_comands.dart';

///
/// Lexer class
///
class Lexer {
  static final List<String> _validDestPrefixes = [];

  ///
  /// Private constructor
  ///
  Lexer._();

  ///
  /// Lex list of list of tokens
  /// [linesOfTokens] - list of list of tokens
  ///
  /// Returns list of list of [VMComand]s
  ///
  static List<VMComand> lex(List<List<Token>> linesOfTokens) {
    _validDestPrefixes.clear();
    List<VMComand> comands = [];

    for (final lot in linesOfTokens) {
      if (lot.isEmpty) {
        continue;
      }

      final comand = Lexer._parseComand(lot);
      final val = comand.value;
      final exc = comand.exception;
      if (val != null) {
        comands.add(val);
      } else if (exc != null) {
        stderr.writeln(exc);
      } else {
        throw Exception('Unexpected error: no value from parser nor exception');
      }
    }

    return comands;
  }

  static OptionalOf<VMComand> _parseComand(List<Token> tokens) {
    if (tokens.isNotEmpty && _expectToken(tokens[0], TokenType.word)) {
      final args = tokens.sublist(1);
      switch (tokens[0].value.toLowerCase()) {
        case '@meta':
          return _parseMetaComand(args);
        case 'echo':
          return _parseEcho(args);
        case 'exit':
          return _parseExit(args);
        case 'print':
          return _parsePrint(args);
        case 'clear':
          return _parseClear(args);
        case 'add':
          return _parseAdd(args);
        case 'rem':
          return _parseRem(args);
        case 'rename':
          return _parseRename(args);
        case 'sort':
          return _parseSort(args);
        case 'cspd':
          return _parseCheckSpeed(args);
      }
    }

    return OptionalOf.error(Exception("Unknown lex sequence: $tokens"));
  }

  static bool _expectToken(Token token, TokenType type) {
    return token.type == type;
  }

  static bool _expectTokens(List<Token> tokens, List<TokenType> types) {
    if (tokens.length != types.length) {
      return false;
    }

    for (var i = 0; i < tokens.length; i++) {
      if (tokens[i].type != types[i]) {
        return false;
      }
    }

    return true;
  }

  static OptionalOf<VMComand> _parseMetaComand(List<Token> tokens) {
    if (tokens.isNotEmpty && _expectToken(tokens[0], TokenType.word)) {
      switch (tokens[0].value.toLowerCase()) {
        case 'append-to-var':
          return _parseMetaAppendToVar(tokens.sublist(1));
      }
    }

    return OptionalOf.error(Exception("Unknown meta comand: $tokens"));
  }

  static OptionalOf<VMComand> _parseMetaAppendToVar(List<Token> tokens) {
    if (tokens.length >= 2 && _expectToken(tokens[0], TokenType.word)) {
      final variable = tokens[0].asString;
      final values = tokens.sublist(1);
      switch (variable) {
        case 'destination_prefixes':
          Lexer._validDestPrefixes.addAll(values.map((e) => e.asString));
          return OptionalOf.ok(VMComandEcho(
            "[meta] new valid prefixes list: ${Lexer._validDestPrefixes}",
          ));
      }
    }

    return OptionalOf.error(Exception(
      "Expected values for append-to-var! ($tokens)",
    ));
  }

  static OptionalOf<VMComand> _parseEcho(List<Token> args) {
    return OptionalOf.ok(VMComandEcho(args.map((e) => e.asString).join(" ")));
  }

  static OptionalOf<VMComand> _parseExit(List<Token> args) {
    if (args.isEmpty) {
      return OptionalOf.ok(VMComandExit(0));
    } else if (Lexer._expectTokens(args, [TokenType.number])) {
      return OptionalOf.ok(VMComandExit(args[0].asInt));
    }

    return OptionalOf.error(Exception('Error: exit should be `exit [<code>]`'));
  }

  static OptionalOf<VMComand> _parsePrint(List<Token> args) {
    if (Lexer._expectTokens(args, [])) {
      return OptionalOf.ok(VMComandPrint());
    }

    return OptionalOf.error(Exception('Error: print should be `print`'));
  }

  static OptionalOf<VMComand> _parseClear(List<Token> args) {
    if (Lexer._expectTokens(args, [])) {
      return OptionalOf.ok(VMComandClear());
    }

    return OptionalOf.error(Exception('Error: clear should be `clear`'));
  }

  static OptionalOf<VMComand> _parseAdd(List<Token> args) {
    if (args.isNotEmpty && _expectToken(args[0], TokenType.word)) {
      switch (args[0].asString) {
        case 'train':
          return _parseAddTrain(args.sublist(1));
        case 'plane':
          return _parseAddPlane(args.sublist(1));
        case 'boat':
          return _parseAddBoat(args.sublist(1));
      }
    }

    return OptionalOf.error(
        Exception('Error: add should be `add <name> ...<args>`'));
  }

  static OptionalOf<VMComand> _parseAddTrain(List<Token> args) {
    if (_expectTokens(args, [
      TokenType.word,
      TokenType.number,
      TokenType.number,
      TokenType.number,
      TokenType.word,
      TokenType.word,
    ])) {
      if (!_validDestPrefixes.contains(args[4].asString)) {
        return OptionalOf.error(Exception(
          "Error: add train: invalid destination prefix: `${args[4].asString}`",
        ));
      }
      return OptionalOf.ok(VMComandAdd(TrainEntity(
        args[2].asInt,
        args[3].asInt,
        "${args[4].asString} ${args[5].asString}",
        args[0].asString,
        args[1].asInt,
      )));
    }

    return OptionalOf.error(Exception(
      'Error: train add cmd should be `add train <name> <cnt> <spd> <dist> <dest>`',
    ));
  }

  static OptionalOf<VMComand> _parseAddPlane(List<Token> args) {
    if (_expectTokens(args, [
      TokenType.word,
      TokenType.number,
      TokenType.number,
      TokenType.number,
      TokenType.number,
      TokenType.word,
      TokenType.word,
    ])) {
      if (!_validDestPrefixes.contains(args[5].asString)) {
        return OptionalOf.error(Exception(
          "Error: add plane: invalid destination prefix: `${args[5].asString}`",
        ));
      }
      return OptionalOf.ok(VMComandAdd(PlaneEntity(
        args[3].asInt,
        args[4].asInt,
        "${args[5].asString} ${args[6].asString}",
        args[0].asString,
        args[1].asInt,
        args[2].asInt,
      )));
    }

    return OptionalOf.error(Exception(
      'Error: plane add cmd should be `add plane <name> <len> <cap> <spd> <dist> <dest>`',
    ));
  }

  static OptionalOf<VMComand> _parseAddBoat(List<Token> args) {
    if (_expectTokens(args, [
      TokenType.word,
      TokenType.number,
      TokenType.number,
      TokenType.number,
      TokenType.number,
      TokenType.word,
      TokenType.word,
    ])) {
      if (!_validDestPrefixes.contains(args[5].asString)) {
        return OptionalOf.error(Exception(
          "Error: add boat: invalid destination prefix: `${args[5].asString}`",
        ));
      }
      return OptionalOf.ok(VMComandAdd(BoatEntity(
        args[3].asInt,
        args[4].asInt,
        "${args[5].asString} ${args[6].asString}",
        args[0].asString,
        args[1].asInt,
        args[2].asInt,
      )));
    }

    return OptionalOf.error(Exception(
      'Error: boat add cmd should be `add boat <name> <disp> <year> <spd> <dist> <dest>`',
    ));
  }

  static OptionalOf<VMComand> _parseRem(List<Token> args) {
    if (args.length == 4 &&
        _expectToken(args[0], TokenType.word) &&
        args[0].asString == "if" &&
        _expectToken(args[1], TokenType.word) &&
        _expectToken(args[2], TokenType.word)) {
      final attr = args[1].asString;
      final op = args[2].asString;

      return OptionalOf.ok(VMComandRem(attr, args[3].asString, op));
    }

    return OptionalOf.error(Exception(
      'Error: rem should be `rem if <attr> <op> <value>`',
    ));
  }

  static OptionalOf<VMComand> _parseRename(List<Token> args) {
    if (_expectTokens(args, [TokenType.number, TokenType.word])) {
      return OptionalOf.ok(VMComandRename(args[0].asInt, args[1].asString));
    }

    return OptionalOf.error(Exception(
      'Error: rename should be `rename <index> <new name>`',
    ));
  }

  static OptionalOf<VMComand> _parseSort(List<Token> args) {
    if (_expectTokens(args, [TokenType.word])) {
      return OptionalOf.ok(VMComandSort(args[0].asString));
    }

    return OptionalOf.error(Exception(
      'Error: sort should be `sort <attribute>`',
    ));
  }

  static OptionalOf<VMComand> _parseCheckSpeed(List<Token> args) {
    if (Lexer._expectTokens(args, [])) {
      return OptionalOf.ok(VMComandCheckSpeed());
    }

    return OptionalOf.error(Exception('Error: cspd should be `cspd`'));
  }
}
