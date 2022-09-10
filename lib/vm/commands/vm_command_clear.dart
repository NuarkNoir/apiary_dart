import '../vm.dart';
import 'vm_command.dart';

///
/// Command to clear the list
///
class VMCommandClear implements VMCommand {
  const VMCommandClear();

  @override
  Future<void> execute(VMContext ctx) async {
    ctx.entities.clear();
  }
}
