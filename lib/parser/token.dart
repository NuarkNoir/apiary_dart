import 'token_type.dart';

class Token {
  final TokenType _type;
  final String _value;

  TokenType get type => _type;
  String get value => _value;

  Token(this._type, this._value);

  int get asInt => int.parse(_value);
  double get asDouble => double.parse(_value);
  String get asString => _value;

  @override
  String toString() {
    return 'Token{type: $type, value: $value}';
  }
}
