import 'package:dartz/dartz.dart';
import 'package:marvel/domain/entities/character_entity.dart';
import 'package:marvel/domain/exceptions/character_exception.dart';
import 'package:marvel/domain/repositories/get_characters_repository.dart';
import 'package:marvel/domain/usecases/get_characters_usecase/get_characters_usecase.dart';

class GetCharactersUsecaseImp implements GetCharactersUsecase {
  final GetCharactersRepository _repository;
  GetCharactersUsecaseImp(this._repository);

  @override
  Future<Either<CharacterException, List<CharacterEntity>>> call({required int offset, required int limit}) {
    return _repository(offset: offset, limit: limit);
  }
}