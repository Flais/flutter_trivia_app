import 'package:trivia_app_flutter/app/modules/home/infra/external_interfaces/data_souces_interfaces/number_trivia_data_source_interface.dart';
import 'package:trivia_app_flutter/app/modules/home/infra/external_interfaces/drivers_interfaces/http_client.dart';

class NumbersAPIGetNumberTriviaDataSource implements INumberTriviaDataSource {
  final IHttpClient _httpClient;

  NumbersAPIGetNumberTriviaDataSource(IHttpClient httpClient)
      : this._httpClient = httpClient;

  @override
  Future<Map<String, dynamic>> getTriviaData({double numberTrivia}) async {

    /*
    Return Format
      {
       "text": "143 is the number of milligrams of caffeine in AMP Energy.",
       "number": 143,
       "found": true,
       "type": "trivia"
      }
    */
    return await _httpClient
        .get('http://numbersapi.com/${numberTrivia.toInt()}/trivia?json');
  }
}
