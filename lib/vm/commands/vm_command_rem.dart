import 'package:apiary_dart/entities/base_entity.dart';
import 'package:apiary_dart/utils/comparators.dart';

import '../vm.dart';
import 'vm_command.dart';

class VMCommandRem implements VMCommand {
  final String _attr;
  final String _value;
  final String _op;

  const VMCommandRem(this._attr, this._value, this._op);

  @override
  Future<void> execute(VMContext ctx) async {
    bool removed = false;
    do {
      for (int i = 0; i < ctx.entities.length; i++) {
        final ent = ctx.entities.get(i);
        if (ent != null && Comparators.compareAttr(ent, _attr, _value, _op)) {
          ctx.entities.remove(ent);
          removed = true;
        }
      }
    } while (removed);
  }
}
