import 'circular_linked_list_node.dart';

///
/// Circular linked list
/// [T] - type of the list
///
class CircularLinkedList<T> {
  CircularLinkedListNode<T>? _head;
  int _length = 0;

  /// Length getter
  int get length => _length;

  /// First node getter
  CircularLinkedListNode<T>? get head => _head;

  /// Last node getter
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

  ///
  /// Add node to the list
  /// [node] - node to add
  ///
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

  ///
  /// Get value by index
  /// [index] - index
  ///
  /// Returns value or throws [RangeError]
  ///
  T? get(int index) {
    if (index < 0 || index >= _length) {
      throw RangeError("Index out of range");
    }
    var node = _head;
    for (var i = 0; i < index; i++) {
      node = node!.next as CircularLinkedListNode<T>?;
    }
    return node?.data;
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

  ///
  /// Remove node by index
  /// [n] - index
  ///
  void popNth(int n) {
    if (n == 0) {
      popHead();
      return;
    }
    var node = _head;
    for (var i = 0; i < n - 1; i++) {
      node = node!.next as CircularLinkedListNode<T>?;
    }
    node!.next = node.next!.next;
    _length--;
  }

  ///
  /// Find node by value
  /// [data] - value
  ///
  /// Returns index or -1 if not found
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

  ///
  /// Remove node by value
  /// [data] - value
  ///
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

  ///
  /// Remove all nodes
  ///
  void clear() {
    if (head != null && head!.next != head!.next) {
      head!.next = null;
    }
    _head = null;
    _length = 0;
  }

  ///
  /// Sort list by comparator
  /// [comparator] - comparator
  ///
  void sort(bool Function(T a, T b) comparator) {
    if (_head == null) {
      return;
    }
    var node = _head;
    for (var i = 0; i < _length; i++) {
      var nextNode = node!.next as CircularLinkedListNode<T>?;
      for (var j = i + 1; j < _length; j++) {
        if (comparator(node.data, nextNode!.data)) {
          final temp = node.data;
          node.data = nextNode.data;
          nextNode.data = temp;
        }
        nextNode = nextNode.next as CircularLinkedListNode<T>?;
      }
      node = node.next as CircularLinkedListNode<T>?;
    }
  }
}
