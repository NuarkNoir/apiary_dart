import 'package:apiary_dart/apiary_dart.dart';
import 'package:apiary_dart/entities/train_entity.dart';
import 'package:apiary_dart/utils/circular_linked_list.dart';
import 'package:apiary_dart/vm/commands/vm_command_clear.dart';
import 'package:apiary_dart/vm/vm_commands.dart';
import 'package:test/test.dart';

void main() {
  test("Circular list test", () {
    final list = CircularLinkedList<int>();
    expect(list.head, null);
    expect(list.tail, null);

    list.add(1);
    list.add(2);
    list.add(3);

    expect(list.head!.data, 1);
    expect(list.tail!.data, 3);

    list.add(4);
    list.add(5);
    list.add(6);

    expect(list.head!.data, 1);
    expect(list.tail!.data, 6);

    expect(list.length, 6);
    expect(list.get(0), 1);
    expect(list.get(1), 2);
    expect(() => list.get(81), throwsA(TypeMatcher<RangeError>()));

    list.popHead();
    expect(list.head!.data, 2);
    expect(list.tail!.data, 6);
    expect(list.tail!.next!.data, 2);

    list.popNth(2);
    expect(list.get(2), 5);

    list.remove(9);
    expect(list.length, 4);
    list.remove(2);
    expect(list.length, 3);
  });
  test("VMContext skeleton test", () async {
    final vmContext = VMContext.createVMContext();
    expect(vmContext.entities.length, 0);
    await vmContext.executeCommands();
  });

  test("VMCommandEcho test", () async {
    final vmContext = VMContext.createVMContext();
    expect(
      () => vmContext.pushCommand(VMCommandEcho('Hello, world!')),
      returnsNormally,
    );
    await vmContext.executeCommands();
  });

  test("VMCommandRename test", () async {
    final vmContext = VMContext.createVMContext();
    expect(
      () => vmContext.pushCommand(
          VMCommandAdd(TrainEntity(5, 5, "test", "train name", 8))),
      returnsNormally,
    );
    expect(
      () => vmContext.pushCommand(VMCommandRename(0, "new train name")),
      returnsNormally,
    );
    await vmContext.executeCommands();
    expect(vmContext.entities.length, 1);
    expect(vmContext.entities.get(0)!.name, "new train name");
  });

  test("VMCommandRem test", () async {
    final vmContext = VMContext.createVMContext();
    expect(
      () => vmContext.pushCommand(
          VMCommandAdd(TrainEntity(5, 5, "test", "train name", 8))),
      returnsNormally,
    );
    expect(
      () => vmContext.pushCommand(
          VMCommandAdd(TrainEntity(5, 5, "test", "train name", 7))),
      returnsNormally,
    );
    expect(
      () => vmContext.pushCommand(VMCommandRem("name", "train name", "=")),
      returnsNormally,
    );
    await vmContext.executeCommands();
    expect(vmContext.entities.length, 0);
  });

  test("VMCommandClear test", () async {
    final vmContext = VMContext.createVMContext();
    expect(
      () => vmContext.pushCommand(
          VMCommandAdd(TrainEntity(5, 5, "test", "train name", 8))),
      returnsNormally,
    );
    expect(
      () => vmContext.pushCommand(VMCommandClear()),
      returnsNormally,
    );
    await vmContext.executeCommands();
    expect(vmContext.entities.length, 0);
  });
}
