class CircularLinkedListNode<T> {
  T data;
  CircularLinkedListNode? next;

  CircularLinkedListNode(this.data);

  @override
  int get hashCode => Object.hash(data, next);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! CircularLinkedListNode) return false;
    return data == other.data && next == other.next;
  }
}
