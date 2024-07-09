import 'package:dartz/dartz.dart';
import 'package:marvel/data/datasource/remote/get_recommends_characters_remote_datasource/get_recommends_characters_remote_datasource.dart';
import 'package:marvel/domain/entities/character_entity.dart';
import 'package:marvel/domain/exceptions/character_exception.dart';
import 'package:marvel/domain/repositories/get_recommends_characters_repository.dart';

class GetRecommendsCharactersRepositoryImp implements GetRecommendsCharactersRepository {
  final GetRecommendsCharactersRemoteDatasource _datasource;
  GetRecommendsCharactersRepositoryImp(this._datasource);

  @override
  Future<Either<CharacterException, List<CharacterEntity>>> call({required int characterId}) {
    return _datasource(characterId: characterId);
  } 
}