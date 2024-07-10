import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marvel/domain/entities/character_entity.dart';
import 'package:marvel/domain/usecases/get_characters_usecase/get_characters_usecase.dart';
import 'package:marvel/domain/usecases/get_recommends_characters_usecase/get_recommends_characters_usecase.dart';

class CharacterController extends GetxController {
  final GetCharactersUsecase _getCharactersUsecase;
  final GetRecommendsCharactersUsecase _getRecommendsCharactersUsecase;
  CharacterController(
    this._getCharactersUsecase,
    this._getRecommendsCharactersUsecase
  );

  RxBool isLoading           = false.obs;
  RxBool isLoadingRecommends = false.obs;

  RxList<CharacterEntity> characters            = <CharacterEntity>[].obs;
  RxList<CharacterEntity> charactersRecommends  = <CharacterEntity>[].obs;


  Future<void> getCharacters({ required int offset }) async {
    isLoading.value = true;

    final data = await _getCharactersUsecase(offset: offset, limit: 20);
    data.fold(
      (l) => Get.showSnackbar(
        GetSnackBar(
          title: l.code.toString(),
          message: l.message,
          backgroundColor: Colors.red,
        )
      ), 
      (r) => characters.value = r
    );

    isLoading.value = false;
  }

  Future<void> getRecommends({ required int characterId }) async {
    isLoadingRecommends.value = true;

    final data = await _getRecommendsCharactersUsecase(characterId: characterId);
    data.fold(
      (l) => Get.showSnackbar(
        GetSnackBar(
          title: l.code.toString(),
          message: l.message,
          backgroundColor: Colors.red,
        )
      ), 
      (r) => charactersRecommends.value = r
    );

    isLoadingRecommends.value = false;
  }
  
}