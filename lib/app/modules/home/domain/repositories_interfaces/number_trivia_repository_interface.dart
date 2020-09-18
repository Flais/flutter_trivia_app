import 'package:trivia_app_flutter/app/modules/home/infra/models/trivia_model.dart';

abstract class INumberTriviaRepository {


  Future<TriviaModel> getTrivia({double numberTrivia});
}
