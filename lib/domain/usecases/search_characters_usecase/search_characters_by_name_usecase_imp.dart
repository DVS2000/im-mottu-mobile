import 'package:dartz/dartz.dart';
import 'package:marvel/domain/entities/character_entity.dart';
import 'package:marvel/domain/exceptions/character_exception.dart';
import 'package:marvel/domain/repositories/search_characters_by_name_repository.dart';
import 'search_characters_by_name_usecase.dart';

class SearchCharactersByNameUsecaseImp implements SearchCharactersByNameUsecase {
  final SearchCharactersByNameRepository _repository;
  SearchCharactersByNameUsecaseImp(this._repository);

  @override
  Future<Either<CharacterException, List<CharacterEntity>>> call({required String name, required int offset, required int limit}) {
    return _repository(name: name, offset: offset, limit: limit);
  }
  
}