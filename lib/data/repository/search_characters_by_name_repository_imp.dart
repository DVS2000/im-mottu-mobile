import 'package:dartz/dartz.dart';
import 'package:marvel/data/datasource/remote/search_characters_by_name_remote_datasource/search_characters_by_name_remote_datasource.dart';
import 'package:marvel/domain/entities/characters_entity.dart';
import 'package:marvel/domain/exceptions/character_exception.dart';
import 'package:marvel/domain/repositories/search_characters_by_name_repository.dart';

class SearchCharactersByNameRepositoryImp implements SearchCharactersByNameRepository {
  final SearchCharactersByNameRemoteDatasource _datasource;
  SearchCharactersByNameRepositoryImp(this._datasource);

  @override
  Future<Either<CharacterException, CharactersEntity>> call({required String name, required int offset, required int limit}) {
    return _datasource(name: name, offset: offset, limit: limit);
  }
}