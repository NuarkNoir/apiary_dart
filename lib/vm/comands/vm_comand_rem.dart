import '../../utils/comparators.dart';
import '../vm.dart';
import 'vm_comand.dart';

///
/// Comand to remove entity from the list by its attr value
///
class VMComandRem implements VMComand {
  final String _attr;
  final String _value;
  final String _op;

  const VMComandRem(this._attr, this._value, this._op);

  @override
  Future<void> execute(VMContext ctx) async {
    bool removed;
    do {
      removed = false;
      for (int i = 0; i < ctx.entities.length; i++) {
        final ent = ctx.entities.get(i);
        if (ent != null && Comparators.compareAttr(ent, _attr, _value, _op)) {
          ctx.entities.remove(ent);
          removed = true;
          break;
        }
      }
    } while (removed);
  }
}
