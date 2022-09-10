import 'package:apiary_dart/entities/base_entity.dart';

import '../vm.dart';
import 'vm_command.dart';

class VMCommandAdd implements VMCommand {
  final BaseEntity _entity;

  VMCommandAdd(this._entity);

  @override
  Future<void> execute(VMContext ctx) async {
    ctx.entities.add(_entity);
  }
}
