import 'token.dart';
import 'token_type.dart';

///
/// Parser class
///
class Parser {
  final List<List<Token>> _tokens = [];

  /// Tokens getter
  List<List<Token>> get linesOfTokens => _tokens;

  ///
  /// Constructor
  ///
  Parser();

  ///
  /// Parse list of strings
  /// [input] - list of strings
  ///
  void parse(Iterable<String> input) {
    _tokens.clear();

    for (var line in input) {
      parseLine(line);
    }
  }

  ///
  /// Parse single line string
  /// [line] - string
  ///
  void parseLine(String line) {
    line = line.trim();
    if (line.isEmpty || line.startsWith("#")) return;

    _tokens.add(
      line.split(' ').map<Token>(_getToken).toList(growable: false),
    );
  }

  Token _getToken(String word) {
    word = word.trim();
    if (int.tryParse(word) != null) {
      return Token(TokenType.number, word);
    } else if (double.tryParse(word) != null) {
      return Token(TokenType.double, word);
    } else {
      return Token(TokenType.word, word);
    }
  }
}
