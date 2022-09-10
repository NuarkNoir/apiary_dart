import 'dart:io';

import '../vm.dart';
import 'vm_command.dart';

///
/// Command to print the list
///
class VMComandPrint implements VMCommand {
  @override
  Future<void> execute(VMContext ctx) async {
    stdout.writeln("Count of elements: ${ctx.entities.length}");
    if (ctx.entities.length > 0) {
      for (int i = 0; i < ctx.entities.length; i++) {
        final ent = ctx.entities.get(i);
        stdout.writeln("$i. ${ent?.toString() ?? "[null element at $i]"}");
      }
    } else {
      stdout.writeln("No elements");
    }
  }
}
