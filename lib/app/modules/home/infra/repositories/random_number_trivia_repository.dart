import 'package:trivia_app_flutter/app/modules/home/domain/repositories_interfaces/random_number_trivia_repository_interface.dart';
import 'package:trivia_app_flutter/app/modules/home/infra/external_interfaces/data_souces_interfaces/random_number_trivia_data_source_interface.dart';
import 'package:trivia_app_flutter/app/modules/home/infra/models/trivia_model.dart';

class RandomNumberTriviaRepository implements IRandomNumberTriviaRepository {
  final IRandomNumberTriviaDataSource _dataSource;

  RandomNumberTriviaRepository(IRandomNumberTriviaDataSource dataSource)
      : this._dataSource = dataSource;

  @override
  Future<TriviaModel> getRandomTrivia({int numberTrivia}) async {
    final _response = await _dataSource.getRandomTriviaData();

    return TriviaModel.fromJson(_response);
  }
}
