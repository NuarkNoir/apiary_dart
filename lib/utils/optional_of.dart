class OptionalOf<T> {
  final T? value;
  final Exception? exception;

  OptionalOf._(this.value, this.exception);

  factory OptionalOf.ok(T value) {
    return OptionalOf._(value, null);
  }

  factory OptionalOf.error(Exception exception) {
    return OptionalOf._(null, exception);
  }

  @override
  String toString() {
    return 'OptionalOf{value: $value, exception: $exception}';
  }
}
