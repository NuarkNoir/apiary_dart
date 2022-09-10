import 'dart:io';

import '../vm.dart';
import 'vm_command.dart';

///
/// Command to rename entity
///
class VMCommandRename implements VMCommand {
  final int _index;
  final String _newName;

  const VMCommandRename(this._index, this._newName);

  @override
  Future<void> execute(VMContext ctx) async {
    if (_index < 0 || _index >= ctx.entities.length) {
      stderr.writeln("rename: index out of range");
    } else {
      ctx.entities.get(_index)?.name = _newName;
    }
  }
}
