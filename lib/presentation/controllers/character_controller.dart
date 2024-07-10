import 'package:get/get.dart';
import 'package:marvel/domain/entities/character_entity.dart';
import 'package:marvel/domain/exceptions/character_exception.dart';
import 'package:marvel/domain/usecases/get_characters_usecase/get_characters_usecase.dart';

class CharacterController extends GetxController {
  final GetCharactersUsecase _getCharactersUsecase;
  CharacterController(this._getCharactersUsecase);

  RxBool isLoading = false.obs;
  RxList<CharacterEntity> characters = <CharacterEntity>[].obs;

  Rx<CharacterException> exception = CharacterException(0, "").obs;

  Future<void> getCharacters({ required int offset }) async {
    isLoading.value = true;

    final data = await _getCharactersUsecase(offset: offset, limit: 20);
    data.fold(
      (l) => exception.value = l, 
      (r) {
        characters.value = r;
        exception.value = CharacterException(0, "");
      }
    );

    isLoading.value = false;
  }
  
}