import 'package:apiary_dart/apiary_dart.dart';
import 'package:apiary_dart/entities/boat_entity.dart';
import 'package:apiary_dart/entities/plane_entity.dart';
import 'package:apiary_dart/entities/train_entity.dart';
import 'package:apiary_dart/parser/parser.dart';
import 'package:apiary_dart/parser/token_type.dart';
import 'package:apiary_dart/utils/circular_linked_list.dart';
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

  test("Circular list sort test", () {
    final list = CircularLinkedList<int>();
    expect(list.head, null);
    expect(list.tail, null);

    list.add(1);
    list.add(9);
    list.add(3);
    list.add(7);
    list.add(5);
    list.add(9);

    expect(list.length, 6);

    list.sort((a, b) => a < b);

    expect(list.get(0), 9);
    expect(list.get(1), 9);
    expect(list.get(2), 7);
    expect(list.get(3), 5);
    expect(list.get(4), 3);
    expect(list.get(5), 1);

    list.sort((a, b) => a > b);

    expect(list.get(0), 1);
    expect(list.get(1), 3);
    expect(list.get(2), 5);
    expect(list.get(3), 7);
    expect(list.get(4), 9);
    expect(list.get(5), 9);
  });

  test("VMComandSort test", () async {
    final vmContext = VMContext.createVMContext();
    expect(
      () => vmContext.pushCommand(
          VMCommandAdd(TrainEntity(100, 5, "test", "train name", 8))),
      returnsNormally,
    );
    expect(
      () => vmContext.pushCommand(
          VMCommandAdd(TrainEntity(21, 5, "test", "train name", 800))),
      returnsNormally,
    );
    expect(
      () => vmContext.pushCommand(
          VMCommandAdd(TrainEntity(799, 5, "test", "train name", 8))),
      returnsNormally,
    );
    expect(
      () => vmContext.pushCommand(VMComandSort("spd")),
      returnsNormally,
    );
    await vmContext.executeCommands();
    expect(vmContext.entities.get(0)?.spd, 799);
    expect(vmContext.entities.get(2)?.spd, 21);

    expect(
      () => vmContext.pushCommand(
          VMCommandAdd(TrainEntity(100, 5, "test2", "train name", 8))),
      returnsNormally,
    );
    expect(
      () => vmContext.pushCommand(
          VMCommandAdd(BoatEntity(21, 5, "test", "boat name", 800, 1999))),
      returnsNormally,
    );
    expect(
      () => vmContext.pushCommand(
          VMCommandAdd(PlaneEntity(799, 5, "test", "plane name", 8, 31))),
      returnsNormally,
    );
    expect(
      () => vmContext.pushCommand(VMComandSort("dest")),
      returnsNormally,
    );
    await vmContext.executeCommands();
    expect(vmContext.entities.get(0)?.dest, "test2");
    expect(vmContext.entities.get(2)?.dest, "test");
  });

  test("VMComandPrint test", () async {
    final vmContext = VMContext.createVMContext();
    expect(
      () => vmContext.pushCommand(
          VMCommandAdd(TrainEntity(1, 2, "test", "train name", 3))),
      returnsNormally,
    );
    expect(
      () => vmContext.pushCommand(
          VMCommandAdd(TrainEntity(1, 2, "test", "train name", 3))),
      returnsNormally,
    );
    expect(
      () => vmContext.pushCommand(
          VMCommandAdd(TrainEntity(1, 2, "test", "train name", 3))),
      returnsNormally,
    );
    expect(
      () => vmContext.pushCommand(VMComandPrint()),
      returnsNormally,
    );
    await vmContext.executeCommands();
  });

  test("Parser parse capabilities", () {
    final parser = Parser();

    parser.parse("asd asd\n asd 1.0 1 asd\n".split("\n"));
    expect(parser.linesOfTokens.length, 2);
    expect(
      parser.linesOfTokens[0].map<TokenType>((e) => e.type),
      [TokenType.word, TokenType.word],
    );
    expect(
      parser.linesOfTokens[1].map<TokenType>((e) => e.type),
      [TokenType.word, TokenType.double, TokenType.number, TokenType.word],
    );
  });
}
