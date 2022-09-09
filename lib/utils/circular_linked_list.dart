import 'circular_linked_list_node.dart';

class CircularLinkedList<T> {
  CircularLinkedListNode<T>? _head;
  int _length = 0;

  int get length => _length;

  CircularLinkedListNode<T>? get head => _head;

  CircularLinkedListNode<T>? get tail {
    if (_head == null) {
      return null;
    }
    var node = _head;
    while (node!.next != _head) {
      node = node.next as CircularLinkedListNode<T>?;
    }
    return node;
  }

  void add(T data) {
    final node = CircularLinkedListNode<T>(data);
    if (_head == null) {
      _head = node;
      _head!.next = _head;
    } else {
      final tail = this.tail;
      tail!.next = node;
      node.next = _head;
    }
    _length++;
  }

  T get(int index) {
    if (index < 0 || index >= _length) {
      throw RangeError("Index out of range");
    }
    var node = _head;
    for (var i = 0; i < index; i++) {
      node = node!.next as CircularLinkedListNode<T>?;
    }
    return node!.data;
  }

  void popHead() {
    if (_head == null) {
      return;
    }
    if (_head!.next == _head) {
      _head = null;
    } else {
      final tail = this.tail;
      tail!.next = _head!.next;
      _head = _head!.next as CircularLinkedListNode<T>?;
    }
    _length--;
  }

  void popNth(int n) {
    if (n == 0) {
      popHead();
      return;
    }
    var node = _head;
    for (var i = 0; i < n - 1; i++) {
      node = node!.next as CircularLinkedListNode<T>?;
    }
    node!.next = node!.next!.next;
    _length--;
  }

  int find(T data) {
    if (_head != null) {
      var node = _head;
      for (var i = 0; i < _length; i++) {
        if (node!.data == data) {
          return i;
        }
        node = node.next as CircularLinkedListNode<T>?;
      }
    }
    return -1;
  }

  void remove(T data) {
    // collapse first null check, because popHead() already checks for null
    if (_head == null || _head!.data == data) {
      popHead();
      return;
    }
    int index = find(data);
    if (index >= 0) {
      popNth(index);
    }
  }
}
