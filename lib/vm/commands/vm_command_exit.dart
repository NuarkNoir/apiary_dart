import 'dart:io';

import '../vm.dart';
import 'vm_command.dart';

class VMCommandExit extends VMCommand {
  final int _code;

  VMCommandExit(this._code);

  @override
  Future<void> execute(VMContext _) async {
    stdout.writeln('Exiting with code $_code');
    exit(_code);
  }
}
