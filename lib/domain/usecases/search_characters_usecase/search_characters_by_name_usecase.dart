import 'package:dartz/dartz.dart';
import 'package:marvel/domain/entities/characters_entity.dart';
import 'package:marvel/domain/exceptions/character_exception.dart';

abstract class SearchCharactersByNameUsecase {
  Future<Either<CharacterException, CharactersEntity>> call({ required String name, required int offset, required int limit });
}