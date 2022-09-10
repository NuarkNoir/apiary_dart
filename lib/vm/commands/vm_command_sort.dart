import '../../utils/comparators.dart';
import '../vm.dart';
import 'vm_command.dart';

///
/// Command to sort entities by attr
///
class VMComandSort implements VMCommand {
  final String _attr;

  const VMComandSort(this._attr);

  @override
  Future<void> execute(VMContext ctx) async {
    ctx.entities.sort((a, b) => Comparators.compareEntities(a, b, _attr));
  }
}
