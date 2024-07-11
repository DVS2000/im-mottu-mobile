import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:marvel/configs/app_config.dart';
import 'package:path_provider/path_provider.dart';
import 'package:simple_connection_checker/simple_connection_checker.dart';
import 'client_http_driver.dart';

class ClientHttpDriverImp implements ClientHttpDriver {
  final Dio _client = Dio();

  @override
  Future<Response> get({ required String route, required Map<String, String>? headers }) async {
    try {
      bool isConnected = await SimpleConnectionChecker.isConnectedToInternet();

      if (isConnected) {
        
        final dir = await getTemporaryDirectory();
        final store = HiveCacheStore(dir.path);

        // Configuração do interceptor de cache
        final options = CacheOptions(
          store: store,
          policy: CachePolicy.forceCache,
          //hitCacheOnErrorExcept: [401, 403],
          priority: CachePriority.high,
          maxStale: const Duration(days: 2),
        );

        _client.interceptors.add(DioCacheInterceptor(options: options));

        return await _client.get(
          AppConfigs.apiUrl + route,
          options: options.toOptions()
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