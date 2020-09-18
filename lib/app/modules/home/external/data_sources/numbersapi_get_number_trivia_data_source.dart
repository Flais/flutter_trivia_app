import 'package:trivia_app_flutter/app/modules/home/infra/external_interfaces/data_souces_interfaces/number_trivia_data_source_interface.dart';
import 'package:trivia_app_flutter/app/modules/home/infra/external_interfaces/drivers_interfaces/http_client.dart';

class NumbersAPIGetNumberTriviaDataSource implements INumberTriviaDataSource {
  final IHttpClient _httpClient;

  NumbersAPIGetNumberTriviaDataSource(IHttpClient httpClient)
      : this._httpClient = httpClient;

  @override
  Future<Map<String, dynamic>> getTriviaData({double numberTrivia}) async {
    return await _httpClient
        .get('http://numbersapi.com/${numberTrivia.toInt()}/trivia?json');
  }
}
