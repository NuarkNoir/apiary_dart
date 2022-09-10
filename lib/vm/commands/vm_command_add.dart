import '../../entities/base_entity.dart';
import '../vm.dart';
import 'vm_command.dart';

///
/// Command to add entity to the list
///
class VMCommandAdd implements VMCommand {
  final BaseEntity _entity;

  VMCommandAdd(this._entity);

  @override
  Future<void> execute(VMContext ctx) async {
    ctx.entities.add(_entity);
  }
}
