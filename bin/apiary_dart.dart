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

  vmContext.executeCommands();
}
