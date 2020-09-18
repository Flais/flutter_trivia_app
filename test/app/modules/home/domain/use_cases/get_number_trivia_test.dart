import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:trivia_app_flutter/app/core/exceptions/exceptions.dart';
import 'package:trivia_app_flutter/app/modules/home/domain/repositories_interfaces/number_trivia_repository_interface.dart';
import 'package:trivia_app_flutter/app/modules/home/domain/use_cases/get_number_trivia.dart';
import 'package:trivia_app_flutter/app/modules/home/infra/external_interfaces/data_souces_interfaces/number_trivia_data_source_interface.dart';
import 'package:trivia_app_flutter/app/modules/home/infra/models/trivia_model.dart';
import 'package:trivia_app_flutter/app/modules/home/infra/repositories/number_trivia_repository.dart';
import 'package:trivia_app_flutter/app/utils/fixtures/number_trivia_fixture.dart';

class MockNumberTriviaDataSource extends Mock
    implements INumberTriviaDataSource {}

void main() {
  GetNumberTrivia useCase;
  INumberTriviaRepository repository;
  INumberTriviaDataSource dataSource;

  setUp(() {
    dataSource = MockNumberTriviaDataSource();
    repository = NumberTriviaRepository(dataSource);
    useCase = GetNumberTrivia(repository);
  });

  //Could be any number
  final tNumberTrivia = 76;

  group('GetNumberTrivia ese cases tests', () {
    test('Successful - Should return a instance of [TriviaModel]', () async {
      final tNumberTriviaModel = _getNumberTriviaFixtureData();

      //Arrange
      when(dataSource.getTriviaData(numberTrivia: anyNamed('numberTrivia')))
          .thenAnswer((_) => Future.value(numberTriviaFixture));

      //Act
      final tAct =
          await Future.value(useCase.execute(numberTrivia: tNumberTrivia));

      //Expect
      expect(tAct.number, tNumberTriviaModel.number);
      expect(tAct.text, tNumberTriviaModel.text);
    });

    test('Failure - Should return a instance of [NetWorkFailureException]',
        () async {
      //Arrange
      when(dataSource.getTriviaData(numberTrivia: anyNamed('numberTrivia')))
          .thenThrow(NetWorkFailureException());

      //Expect
      expect(Future.value(useCase.execute(numberTrivia: tNumberTrivia)),
          throwsA(isInstanceOf<NetWorkFailureException>()));
    });

    test('Failure - Should return a instance of [UnexpectedException]',
        () async {
      //Arrange
      when(dataSource.getTriviaData(numberTrivia: anyNamed('numberTrivia')))
          .thenThrow(UnexpectedException());

      //Expect
      expect(Future.value(useCase.execute(numberTrivia: tNumberTrivia)),
          throwsA(isInstanceOf<UnexpectedException>()));
    });
  });
}

TriviaModel _getNumberTriviaFixtureData() {
  return TriviaModel(
    number: numberTriviaFixture['number'],
    text: numberTriviaFixture['text'],
  );
}
