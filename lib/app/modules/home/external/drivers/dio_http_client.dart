import 'package:dio/dio.dart';
import 'package:trivia_app_flutter/app/modules/home/infra/external_interfaces/drivers_interfaces/http_client.dart';

class DioHttpClient implements IHttpClient {
  @override
  Future<Map<String, dynamic>> get(String path) async {
    final dio = Dio();

    final _response = await dio.get(path);

    return _response.data;
  }
}
