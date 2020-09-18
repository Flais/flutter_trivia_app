abstract class TriviaEntity {
  final String _text;
  final int _number;

  TriviaEntity({String text, int number})
      : this._number = number,
        this._text = text;
}
