///
/// CircularLinkedListNode is a node in a circular linked list
/// [T] - type of the node
///
class CircularLinkedListNode<T> {
  /// Data
  T data;

  /// Next node
  CircularLinkedListNode? next;

  /// Constructor
  CircularLinkedListNode(this.data);

  ///
  /// Hashcode
  ///
  /// Returns hashcode
  ///
  @override
  int get hashCode => Object.hash(data, next);

  ///
  /// Equals
  ///
  /// Returns true if [other] is this
  ///
  @override
  bool operator ==(Object other) {
    return identical(this, other);
  }
}
