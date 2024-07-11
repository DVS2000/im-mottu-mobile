import 'package:marvel/data/dtos/character_dto.dart';
import 'package:marvel/domain/entities/character_entity.dart';
import 'package:marvel/domain/entities/characters_entity.dart';

class CharactersDto extends CharactersEntity {
  CharactersDto({ super.characters, super.total });

  factory CharactersDto.fromJson(dynamic json) => CharactersDto(
    characters: json["results"] == null ? [] : List<CharacterEntity>.from(
      json["results"].map(
        (x) => CharacterDto.fromJSon(x)
      )
    ),
    total: json["total"] ?? 0
  );
  
}