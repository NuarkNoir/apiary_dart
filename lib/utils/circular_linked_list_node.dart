class CircularLinkedListNode<T> {
  T data;
  CircularLinkedListNode? next;

  CircularLinkedListNode(this.data);

  @override
  int get hashCode => Object.hash(data, next);

  @override
  bool operator ==(Object other) {
    return identical(this, other);
  }
}
