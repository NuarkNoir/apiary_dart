import '../vm.dart';
import 'vm_command.dart';

class VMCommandClear implements VMCommand {
  const VMCommandClear();

  @override
  Future<void> execute(VMContext ctx) async {
    ctx.entities.clear();
  }
}
