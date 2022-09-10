import 'dart:io';

import '../vm.dart';
import 'vm_comand.dart';

///
/// Echo comand
///
class VMComandEcho implements VMComand {
  final Object? _data;

  VMComandEcho(this._data);

  @override
  Future<void> execute(VMContext _) async {
    stdout.writeln(_data);
  }
}
