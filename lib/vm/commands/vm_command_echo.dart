import 'dart:io';

import '../vm.dart';
import 'vm_command.dart';

class VMCommandEcho extends VMCommand {
  final Object? _data;

  VMCommandEcho(this._data);

  @override
  Future<void> execute(VMContext _) async {
    stdout.writeln(_data);
  }
}
