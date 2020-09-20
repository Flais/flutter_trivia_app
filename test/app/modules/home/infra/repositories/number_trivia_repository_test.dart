import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:trivia_app_flutter/app/fixtures/api_success_return.dart';
import 'package:trivia_app_flutter/app/modules/home/domain/repositories_interfaces/number_trivia_repository_interface.dart';
import 'package:trivia_app_flutter/app/modules/home/infra/external_interfaces/data_souces_interfaces/number_trivia_data_source_interface.dart';
import 'package:trivia_app_flutter/app/modules/home/infra/models/trivia_model.dart';
import 'package:trivia_app_flutter/app/modules/home/infra/repositories/number_trivia_repository.dart';

class MockNumberTriviaDataSource extends Mock
    implements INumberTriviaDataSource {}

void main() {
  INumberTriviaRepository repository;
  INumberTriviaDataSource mockDataSource;

  setUp(() {
    mockDataSource = MockNumberTriviaDataSource();
    repository = NumberTriviaRepository(mockDataSource);
  });

  test('Should return a instance of [TriviaModel]', () async {
    //Arrange
    when(mockDataSource.getTriviaData())
        .thenAnswer((_) => Future.value(tApiSuccessReturn));

    //Act
    final tResult = await repository.getTrivia();

    expect(tResult, isInstanceOf<TriviaModel>());
  });
}
