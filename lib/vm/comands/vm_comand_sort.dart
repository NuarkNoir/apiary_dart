import '../../utils/comparators.dart';
import '../vm.dart';
import 'vm_comand.dart';

///
/// Comand to sort entities by attr
///
class VMComandSort implements VMComand {
  final String _attr;

  const VMComandSort(this._attr);

  @override
  Future<void> execute(VMContext ctx) async {
    ctx.entities.sort((a, b) => Comparators.compareEntities(a, b, _attr));
  }
}
