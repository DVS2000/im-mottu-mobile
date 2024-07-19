import 'package:get_it/get_it.dart';
import 'package:marvel/data/datasource/remote/get_characters_remote_datasource/get_characters_remote_datasource.dart';
import 'package:marvel/data/datasource/remote/get_characters_remote_datasource/get_characters_remote_datasource_imp.dart';
import 'package:marvel/data/datasource/remote/get_recommends_characters_remote_datasource/get_recommends_characters_remote_datasource.dart';
import 'package:marvel/data/datasource/remote/get_recommends_characters_remote_datasource/get_recommends_characters_remote_datasource_imp.dart';
import 'package:marvel/data/datasource/remote/search_characters_by_name_remote_datasource/search_characters_by_name_remote_datasource.dart';
import 'package:marvel/data/datasource/remote/search_characters_by_name_remote_datasource/search_characters_by_name_remote_datasource_imp.dart';
import 'package:marvel/data/repository/get_characters_repository_imp.dart';
import 'package:marvel/data/repository/get_recommends_characters_repository_imp.dart';
import 'package:marvel/data/repository/search_characters_by_name_repository_imp.dart';
import 'package:marvel/domain/repositories/get_characters_repository.dart';
import 'package:marvel/domain/repositories/get_recommends_characters_repository.dart';
import 'package:marvel/domain/repositories/search_characters_by_name_repository.dart';
import 'package:marvel/domain/usecases/get_characters_usecase/get_characters_usecase.dart';
import 'package:marvel/domain/usecases/get_characters_usecase/get_characters_usecase_imp.dart';
import 'package:marvel/domain/usecases/get_recommends_characters_usecase/get_recommends_characters_usecase.dart';
import 'package:marvel/domain/usecases/get_recommends_characters_usecase/get_recommends_characters_usecase_imp.dart';
import 'package:marvel/domain/usecases/search_characters_usecase/search_characters_by_name_usecase.dart';
import 'package:marvel/domain/usecases/search_characters_usecase/search_characters_by_name_usecase_imp.dart';
import 'package:marvel/drivers/client_http_driver/client_http_driver.dart';
import 'package:marvel/drivers/client_http_driver/client_http_driver_imp.dart';
import 'package:marvel/presentation/controllers/character_controller.dart';

class Inject {
  static init() {
    GetIt getIt = GetIt.instance;

    // Client Http Driver
    getIt.registerLazySingleton<ClientHttpDriver>(() => ClientHttpDriverImp());

    // Datasources
    getIt.registerLazySingleton<GetCharactersRemoteDatasource>(() => GetCharactersRemoteDatasourceImp(getIt()));
    getIt.registerLazySingleton<GetRecommendsCharactersRemoteDatasource>(() => GetRecommendsCharactersRemoteDatasourceImp(getIt()));
    getIt.registerLazySingleton<SearchCharactersByNameRemoteDatasource>(() => SearchCharactersByNameRemoteDatasourceImp(getIt()));

    // Repositories
    getIt.registerLazySingleton<GetCharactersRepository>(() => GetCharactersRepositoryImp(getIt()));
    getIt.registerLazySingleton<GetRecommendsCharactersRepository>(() => GetRecommendsCharactersRepositoryImp(getIt()));
    getIt.registerLazySingleton<SearchCharactersByNameRepository>(() => SearchCharactersByNameRepositoryImp(getIt()));

    // Usecases
    getIt.registerLazySingleton<GetCharactersUsecase>(() => GetCharactersUsecaseImp(getIt()));
    getIt.registerLazySingleton<GetRecommendsCharactersUsecase>(() => GetRecommendsCharactersUsecaseImp(getIt()));
    getIt.registerLazySingleton<SearchCharactersByNameUsecase>(() => SearchCharactersByNameUsecaseImp(getIt()));


    // Controllers
    getIt.registerLazySingleton<CharacterController>(() => CharacterController(getIt(), getIt(), getIt()));
  }
}