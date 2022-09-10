import '../vm.dart';

///
/// Base class for all commands
///
abstract class VMCommand {
  ///
  /// Executes the command
  /// [ctx] - VM context
  ///
  /// Returns [Future] to wait for the command to complete
  ///
  Future<void> execute(VMContext ctx);
}
