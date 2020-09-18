import 'package:flutter/widgets.dart';
import 'package:trivia_app_flutter/app/modules/home/domain/repositories_interfaces/number_trivia_repository_interface.dart';
import 'package:trivia_app_flutter/app/modules/home/infra/external_interfaces/data_souces_interfaces/number_trivia_data_source_interface.dart';
import 'package:trivia_app_flutter/app/modules/home/infra/models/trivia_model.dart';

class NumberTriviaRepository implements INumberTriviaRepository {
  final INumberTriviaDataSource _dataSource;

  NumberTriviaRepository(INumberTriviaDataSource dataSource) : _dataSource = dataSource;

  @override
  Future<TriviaModel> getTrivia({@required double numberTrivia}) async {
    final _response = await _dataSource.getTriviaData(numberTrivia: numberTrivia);

    return TriviaModel.fromJson(_response);

  }
}
