import 'package:dartz/dartz.dart';
import 'package:marvel/data/datasource/remote/get_characters_remote_datasource/get_characters_remote_datasource.dart';
import 'package:marvel/domain/entities/characters_entity.dart';
import 'package:marvel/domain/exceptions/character_exception.dart';
import 'package:marvel/domain/repositories/get_characters_repository.dart';

class GetCharactersRepositoryImp implements GetCharactersRepository {
  final GetCharactersRemoteDatasource _datasource;
  GetCharactersRepositoryImp(this._datasource);

  @override
  Future<Either<CharacterException, CharactersEntity>> call({required int offset, required int limit}) {
    return _datasource(offset: offset, limit: limit);
  }
  
}