import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:trivia_app_flutter/app/fixtures/api_success_return.dart';
import 'package:trivia_app_flutter/app/modules/home/external/data_sources/numbersapi_get_number_trivia_data_source.dart';
import 'package:trivia_app_flutter/app/modules/home/infra/external_interfaces/data_souces_interfaces/number_trivia_data_source_interface.dart';
import 'package:trivia_app_flutter/app/modules/home/infra/external_interfaces/drivers_interfaces/http_client.dart';

class MockHttpClient extends Mock implements IHttpClient {}

void main() {
  INumberTriviaDataSource dataSource;
  IHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
    dataSource = NumbersAPIGetNumberTriviaDataSource(mockHttpClient);
  });

  test('Should return a instance of [Map<String, dynamic>]', () async {
    //Arrange
    when(mockHttpClient.get(any)).thenAnswer((_) => Future.value(tApiSuccessReturn));

    //Act
    //Could be any number as parameter
    final tResult = await dataSource.getTriviaData(numberTrivia: 1);

    expect(tResult, isInstanceOf<Map<String, dynamic>>());
  });
}
