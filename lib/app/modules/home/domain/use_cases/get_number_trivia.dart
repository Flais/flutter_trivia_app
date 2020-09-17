import 'package:flutter/widgets.dart';
import 'package:trivia_app_flutter/app/modules/home/domain/repositories_interfaces/number_trivia_repository_interface.dart';
import 'package:trivia_app_flutter/app/modules/home/infra/models/trivia_model.dart';

class GetNumberTrivia {
  final INumberTriviaRepository _repository;

  GetNumberTrivia(
    INumberTriviaRepository repository,
  ) : _repository = repository;

  Future<TriviaModel> execute({
    @required int numberTrivia,
  }) async {
    final _triviaEntity =
        await _repository.getTrivia(numberTrivia: numberTrivia);

    return _triviaEntity;
  }
}
