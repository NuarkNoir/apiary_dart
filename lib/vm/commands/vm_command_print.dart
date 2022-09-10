import 'dart:io';

import '../vm.dart';
import 'vm_command.dart';

class VMComandPrint implements VMCommand {
  @override
  Future<void> execute(VMContext ctx) async {
    stdout.writeln("Count of elements: ${ctx.entities.length}");
    for (int i = 0; i < ctx.entities.length; i++) {
      final ent = ctx.entities.get(i);
      stdout.writeln("$i. ${ent?.toString() ?? "[null element at $i]"}");
    }
  }
}
