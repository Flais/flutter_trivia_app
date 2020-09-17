import 'package:flutter/cupertino.dart';
import 'package:trivia_app_flutter/app/modules/home/domain/entities/trivia_entity.dart';

class TriviaModel implements TriviaEntity {
  final int _number;
  final String _text;

  TriviaModel({
    @required int number,
    @required String text,
  })  : _number = number,
        _text = text;

  int get number => this._number;

  String get text => this._text;

  factory TriviaModel.fromJson(Map<String, dynamic> json) {
    return TriviaModel(
      number: json['number'],
      text: json['text'],
    );
  }

  Map<String, dynamic> toJson(TriviaModel triviaModel) {
    return {
      'number': triviaModel.number,
      'text': triviaModel.text,
    };
  }
}
