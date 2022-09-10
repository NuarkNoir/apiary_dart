import 'dart:io';

import 'package:apiary_dart/apiary_dart.dart' as apiary_dart;

void main(List<String> arguments) async {
  if (arguments.length > 1 ||
      (arguments.length == 1 && !File(arguments[0]).existsSync())) {
    print('Usage: apiary_dart [<script path>]');
    return;
  }

  if (arguments.isEmpty) {
    await runRepl();
  } else {
    await runFile(arguments[0]);
  }
}

Future<void> runRepl() async {
  final vmContext = apiary_dart.VMContext.createVMContext();
  final parser = apiary_dart.Parser();

  while (true) {
    stdout.write("> ");
    final line = stdin.readLineSync();
    if (line == null) {
      break;
    }
    parser.parse([line.trim()].where((element) => element.isNotEmpty));
    final lexems = apiary_dart.Lexer.lex(parser.linesOfTokens);
    for (final lexem in lexems) {
      vmContext.pushCommand(lexem);
    }
    parser.linesOfTokens.clear();

    await vmContext.executeCommands();
  }
}

Future<void> runFile(String path) {
  final vmContext = apiary_dart.VMContext.createVMContext();

  final script = File(path).readAsStringSync();
  final parser = apiary_dart.Parser();
  parser.parse(script.split("\n").where((element) => element.isNotEmpty));
  final lexems = apiary_dart.Lexer.lex(parser.linesOfTokens);
  for (final lexem in lexems) {
    vmContext.pushCommand(lexem);
  }

  return vmContext.executeCommands();
}
