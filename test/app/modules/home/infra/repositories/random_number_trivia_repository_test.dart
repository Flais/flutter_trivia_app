import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:trivia_app_flutter/app/fixtures/api_success_return.dart';
import 'package:trivia_app_flutter/app/modules/home/domain/repositories_interfaces/random_number_trivia_repository_interface.dart';
import 'package:trivia_app_flutter/app/modules/home/infra/external_interfaces/data_souces_interfaces/random_number_trivia_data_source_interface.dart';
import 'package:trivia_app_flutter/app/modules/home/infra/models/trivia_model.dart';
import 'package:trivia_app_flutter/app/modules/home/infra/repositories/random_number_trivia_repository.dart';

class MockRandomNumberTriviaDataSource extends Mock
    implements IRandomNumberTriviaDataSource {}

void main() {
  IRandomNumberTriviaRepository repository;
  IRandomNumberTriviaDataSource mockDataSource;

  setUp(() {
    mockDataSource = MockRandomNumberTriviaDataSource();
    repository = RandomNumberTriviaRepository(mockDataSource);
  });

  test('Should return a instance of [TriviaModel]', () async {
    //Arrange
    when(mockDataSource.getRandomTriviaData())
        .thenAnswer((_) => Future.value(tApiSuccessReturn));

    //Act
    final tResult = await repository.getRandomTrivia();

    expect(tResult, isInstanceOf<TriviaModel>());
  });
}
