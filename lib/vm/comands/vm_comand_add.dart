import '../../entities/base_entity.dart';
import '../vm.dart';
import 'vm_comand.dart';

///
/// Comand to add entity to the list
///
class VMComandAdd implements VMComand {
  final BaseEntity _entity;

  VMComandAdd(this._entity);

  @override
  Future<void> execute(VMContext ctx) async {
    ctx.entities.add(_entity);
  }
}
