import '../vm.dart';

abstract class VMCommand {
  Future<void> execute(VMContext ctx);
}
