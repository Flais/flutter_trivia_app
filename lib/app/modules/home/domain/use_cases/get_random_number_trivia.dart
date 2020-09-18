import 'package:trivia_app_flutter/app/modules/home/domain/repositories_interfaces/random_number_trivia_repository_interface.dart';
import 'package:trivia_app_flutter/app/modules/home/infra/models/trivia_model.dart';

class GetRandomNumberTrivia {
  final IRandomNumberTriviaRepository _repository;

  GetRandomNumberTrivia(IRandomNumberTriviaRepository repository)
      : this._repository = repository;

  Future<TriviaModel> execute() async {
    final _triviaEntity = await this._repository.getRandomTrivia();

    return _triviaEntity;
  }
}
