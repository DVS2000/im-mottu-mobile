import 'package:marvel/domain/entities/character_entity.dart';

class CharactersEntity {
  final List<CharacterEntity>? characters;
  final int? total;

  CharactersEntity({this.characters, this.total});
}