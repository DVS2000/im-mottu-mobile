import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:marvel/configs/app_config.dart';
import 'package:marvel/data/dtos/character_dto.dart';
import 'package:marvel/domain/entities/character_entity.dart';
import 'package:marvel/domain/exceptions/character_exception.dart';
import 'package:marvel/drivers/client_http_driver/client_http_driver.dart';
import 'get_characters_remote_datasource.dart';

class GetCharactersRemoteDatasourceImp implements GetCharactersRemoteDatasource {
  final ClientHttpDriver _clientHttpDriver;
  GetCharactersRemoteDatasourceImp(this._clientHttpDriver);

  @override
  Future<Either<CharacterException, List<CharacterEntity>>> call({required int offset, required int limit}) async {
    final response = await _clientHttpDriver.get(
      route: "/characters?ts=${DateTime.now().millisecondsSinceEpoch}&apikey=${AppConfigs.marvelPublicKey}&hash=${AppConfigs.getHashMd5()}&offset=$offset&limit=$limit", 
      headers: { "Content-Type": "application/json" }
    );

    if(response.statusCode == 200) {
      return Right(
        List<CharacterEntity>.from(
          json.decode(response.body)["data"]["results"].map(
            (x) => CharacterDto.fromJSon(x)
          )
        )
      );

    } else {
      return Left(CharacterException(response.statusCode, json.decode(response.body)["message"]));
      
    }
  }
  
}