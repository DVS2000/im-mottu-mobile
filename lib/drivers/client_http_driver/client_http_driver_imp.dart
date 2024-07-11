import 'package:dio/dio.dart';
import 'package:marvel/configs/app_config.dart';
import 'package:simple_connection_checker/simple_connection_checker.dart';
import 'client_http_driver.dart';

class ClientHttpDriverImp implements ClientHttpDriver {
  final Dio _client = Dio();

  @override
  Future<Response> get({ required String route, required Map<String, String>? headers }) async {
    try {
      bool isConnected = await SimpleConnectionChecker.isConnectedToInternet();

      if (isConnected) {
        return await _client.get(
          AppConfigs.apiUrl + route,
        );
        
      } else {
       return Response(
          data: "{\"code\": 511, \"message\": \"Sem internet\"}",
          statusCode: 511,
          requestOptions: RequestOptions()
        );
      }

    } catch (e) {
      return Response(
        data: "{\"code\": 500, \"message\": \"Ocorreu um erro interno\"}",
        statusCode: 500,
        requestOptions: RequestOptions()
      );

    } 
  }
  
}