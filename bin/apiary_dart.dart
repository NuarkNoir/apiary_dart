import 'dart:io';

import 'package:apiary_dart/apiary_dart.dart' as apiary_dart;

void main(List<String> arguments) async {
  arguments = [r"D:\apiary_dart\tests.sota"];
  if (arguments.length > 1 ||
      (arguments.length == 1 && !File(arguments[0]).existsSync())) {
    print('Usage: apiary_dart [<script path>]');
    return;
  }

  final vmContext = apiary_dart.VMContext.createVMContext();

  final script = File(arguments[0]).readAsStringSync();
  final parser = apiary_dart.Parser();
  parser.parse(script.split("\n").where((element) => element.isNotEmpty));
  final lexems = apiary_dart.Lexer.lex(parser.linesOfTokens);
  for (final lexem in lexems) {
    vmContext.pushCommand(lexem);
  }

  vmContext.executeCommands();
}
