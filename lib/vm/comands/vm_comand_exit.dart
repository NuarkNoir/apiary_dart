import 'dart:io';

import '../vm.dart';
import 'vm_comand.dart';

///
/// Comand to exit the program
///
class VMComandExit implements VMComand {
  final int _code;

  VMComandExit(this._code);

  @override
  Future<void> execute(VMContext _) async {
    stdout.writeln('Exiting with code $_code');
    exit(_code);
  }
}
