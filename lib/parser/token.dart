import 'token_type.dart';

///
/// Token class
///
class Token {
  final TokenType _type;
  final String _value;

  /// Token type getter
  TokenType get type => _type;

  /// Token value getter
  String get value => _value;

  ///
  /// Constructor
  /// [type] - token type
  /// [value] - token value
  ///
  Token(this._type, this._value);

  ///
  /// Get token as int
  ///
  int get asInt => int.parse(_value);

  ///
  /// Get token as double
  ///
  double get asDouble => double.parse(_value);

  ///
  /// Get token as string
  ///
  String get asString => _value;

  ///
  /// Converts token to string
  ///
  @override
  String toString() {
    return 'Token{type: $type, value: $value}';
  }
}
