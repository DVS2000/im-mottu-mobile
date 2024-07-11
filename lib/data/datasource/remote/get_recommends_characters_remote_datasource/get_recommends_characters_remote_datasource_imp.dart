import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:marvel/configs/app_config.dart';
import 'package:marvel/domain/entities/character_entity.dart';
import 'package:marvel/domain/exceptions/character_exception.dart';
import 'package:marvel/drivers/client_http_driver/client_http_driver.dart';
import 'get_recommends_characters_remote_datasource.dart';

class GetRecommendsCharactersRemoteDatasourceImp implements GetRecommendsCharactersRemoteDatasource {
  final ClientHttpDriver _clientHttpDriver;
  GetRecommendsCharactersRemoteDatasourceImp(this._clientHttpDriver);

  @override
  Future<Either<CharacterException, List<CharacterEntity>>> call({required int characterId}) async {
    final response = await _clientHttpDriver.get(
      route: "/characters/$characterId/comics?ts=${DateTime.now().millisecondsSinceEpoch}&apikey=${AppConfigs.marvelPublicKey}&hash=${AppConfigs.getHashMd5()}", 
      headers: { "Content-Type": "application/json" }
    );

    if(response.statusCode == 200) {
      final List<dynamic> comics = response.data["data"]["results"];
      List<CharacterEntity> recommendsCharacters = [];
      final ts = DateTime.now().millisecondsSinceEpoch.toString();
      final hash = AppConfigs.getHashMd5();

      for (var comic in comics) {
        for (var character in comic['characters']['items']) {
          if(recommendsCharacters.where((element) => element.name == character['name']).isEmpty) {

          try {
              final characterUrl = '${character['resourceURI']}?ts=$ts&apikey=${AppConfigs.marvelPublicKey}&hash=$hash';
              final characterResponse = await Dio().get(characterUrl);
              final characterData = characterResponse.data;
              
                recommendsCharacters.add(
                  CharacterEntity(
                    name: characterData['data']['results'][0]['name'],
                    thumbnailPath: characterData['data']['results'][0]['thumbnail']['path'],
                    thumbnailExtension: characterData['data']['results'][0]['thumbnail']['extension'],
                    description: characterData['data']['results'][0]['description']
                  )
                );
            } on Exception catch (e) {
              debugPrint(e.toString());
            }
          }
        }
      }

      return Right(recommendsCharacters);

    } else {
      return Left(CharacterException(response.statusCode ?? 500, json.decode(response.data)["message"]));
      
    }
  }
  
}