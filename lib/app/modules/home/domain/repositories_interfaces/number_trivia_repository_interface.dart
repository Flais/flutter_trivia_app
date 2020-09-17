import 'package:trivia_app_flutter/app/modules/home/domain/entities/trivia_entity.dart';

abstract class INumberTriviaRepository {


  Future<TriviaEntity> getTrivia({int numberTrivia});
}
