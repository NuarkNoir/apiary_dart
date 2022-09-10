import '../vm.dart';

///
/// Base class for all comands
///
abstract class VMComand {
  ///
  /// Executes the comand
  /// [ctx] - VM context
  ///
  /// Returns [Future] to wait for the comand to complete
  ///
  Future<void> execute(VMContext ctx);
}
