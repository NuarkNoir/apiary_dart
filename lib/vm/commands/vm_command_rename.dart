import '../vm.dart';
import 'vm_command.dart';

class VMCommandRename implements VMCommand {
  final int _index;
  final String _newName;

  const VMCommandRename(this._index, this._newName);

  @override
  Future<void> execute(VMContext ctx) async {
    ctx.entities.get(_index)?.name = _newName;
  }
}
