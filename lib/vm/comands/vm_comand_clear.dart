import '../vm.dart';
import 'vm_comand.dart';

///
/// Comand to clear the list
///
class VMComandClear implements VMComand {
  const VMComandClear();

  @override
  Future<void> execute(VMContext ctx) async {
    ctx.entities.clear();
  }
}
