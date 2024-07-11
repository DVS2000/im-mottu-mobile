import 'dart:io';
import 'package:http/http.dart';
import 'package:http/io_client.dart';
import 'package:marvel/configs/app_config.dart';
import 'package:simple_connection_checker/simple_connection_checker.dart';
import 'client_http_driver.dart';

class ClientHttpDriverImp implements ClientHttpDriver {
  final _ioc = HttpClient();
  Client _client = Client();

  ClientHttpDriverImp() {
    _ioc.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
    _client = IOClient(_ioc);
  }

  @override
  Future<Response> get({ required String route, required Map<String, String>? headers }) async {
    try {
      bool isConnected = await SimpleConnectionChecker.isConnectedToInternet();

      if (isConnected) {
        return await _client.get(
          Uri.parse(AppConfigs.apiUrl + route),
          headers: headers,
        );
        
      } else {
       return Response("{\"code\": 511, \"message\": \"Sem internet\"}", 511);
      }

    } catch (e) {
      return Response("{\"code\": 500, \"message\": \"Ocorreu um erro interno\"}", 500);

    } 
  }
  
}