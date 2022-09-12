import 'dart:io';

import '../vm.dart';
import 'vm_comand.dart';

class VMComandCheckSpeed implements VMComand {
  @override
  Future<void> execute(VMContext ctx) async {
    stdout.writeln("Count of elements: ${ctx.entities.length}");
    if (ctx.entities.length > 0) {
      for (int i = 0; i < ctx.entities.length; i++) {
        final ent = ctx.entities.get(i);
        if (ent == null) {
          stdout.writeln("$i. [null element at $i]");
        } else {
          stdout.writeln(
            "$i. ${ent.name} will cover distance of ${ent.dist} "
            "to ${ent.dest} with speed ${ent.spd} in ${ent.dist / ent.spd}",
          );
        }
      }
    } else {
      stdout.writeln("Nothing to count time for!");
    }
  }
}
