import 'package:apiary_dart/apiary_dart.dart';
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
}
