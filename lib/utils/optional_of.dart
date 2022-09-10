///
/// Class for optional values
///
class OptionalOf<T> {
  /// The value
  final T? value;

  /// Exception
  final Exception? exception;

  /// Private constructor
  OptionalOf._(this.value, this.exception);

  ///
  /// Creates optional with value
  /// [value] - value
  ///
  factory OptionalOf.ok(T value) {
    return OptionalOf._(value, null);
  }

  ///
  /// Creates optional with exception
  /// [exception] - exception
  ///
  factory OptionalOf.error(Exception exception) {
    return OptionalOf._(null, exception);
  }

  ///
  /// Converts optional to string
  ///
  @override
  String toString() {
    return 'OptionalOf{value: $value, exception: $exception}';
  }
}
