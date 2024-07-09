import 'package:http/http.dart';

abstract class ClientHttpDriver {
  
  Future<Response> get({ required String route, required Map<String, String>? headers });

}