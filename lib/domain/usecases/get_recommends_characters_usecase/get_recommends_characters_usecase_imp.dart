import 'package:dartz/dartz.dart';
import 'package:marvel/domain/entities/character_entity.dart';
import 'package:marvel/domain/exceptions/character_exception.dart';
import 'package:marvel/domain/repositories/get_recommends_characters_repository.dart';
import 'get_recommends_characters_usecase.dart';

class GetRecommendsCharactersUsecaseImp implements GetRecommendsCharactersUsecase {
  final GetRecommendsCharactersRepository _repository;
  GetRecommendsCharactersUsecaseImp(this._repository);

  @override
  Future<Either<CharacterException, List<CharacterEntity>>> call({required int characterId}) {
    return _repository(characterId: characterId);
  }
}