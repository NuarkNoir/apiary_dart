import 'dart:io';

import '../vm.dart';
import 'vm_comand.dart';

///
/// Comand to rename entity
///
class VMComandRename implements VMComand {
  final int _index;
  final String _newName;

  const VMComandRename(this._index, this._newName);

  @override
  Future<void> execute(VMContext ctx) async {
    if (_index < 0 || _index >= ctx.entities.length) {
      stderr.writeln("rename: index out of range");
    } else {
      ctx.entities.get(_index)?.name = _newName;
    }
  }
}
