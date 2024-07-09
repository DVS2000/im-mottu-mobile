import 'package:dartz/dartz.dart';
import 'package:marvel/domain/entities/character_entity.dart';
import 'package:marvel/domain/exceptions/character_exception.dart';

abstract class GetRecommendsCharactersRemoteDatasource {
  Future<Either<CharacterException, List<CharacterEntity>>> call({ required int characterId });
}