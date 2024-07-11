import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:marvel/configs/app_config.dart';
import 'package:marvel/data/dtos/characters_dto.dart';
import 'package:marvel/domain/entities/characters_entity.dart';
import 'package:marvel/domain/exceptions/character_exception.dart';
import 'package:marvel/drivers/client_http_driver/client_http_driver.dart';
import 'search_characters_by_name_remote_datasource.dart';

class SearchCharactersByNameRemoteDatasourceImp implements SearchCharactersByNameRemoteDatasource {
  final ClientHttpDriver _clientHttpDriver;
  SearchCharactersByNameRemoteDatasourceImp(this._clientHttpDriver);

  @override
  Future<Either<CharacterException, CharactersEntity>> call({required String name, required int offset, required int limit}) async  {
    final response = await _clientHttpDriver.get(
      route: "/characters?ts=${DateTime.now().millisecondsSinceEpoch}&apikey=${AppConfigs.marvelPublicKey}&hash=${AppConfigs.getHashMd5()}&offset=$offset&limit=$limit&nameStartsWith=$name", 
      headers: { "Content-Type": "application/json" }
    );

    if(response.statusCode == 200) {
      return Right(
        CharactersDto.fromJson(response.data["data"])
      );

    } else {
      return Left(CharacterException(response.statusCode ?? 500, json.decode(response.data)["message"]));
      
    }
  }
}