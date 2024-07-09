import 'package:marvel/domain/entities/character_entity.dart';

class CharacterDto extends CharacterEntity {
  CharacterDto({super.id, super.name, super.description, super.thumbnailPath, super.thumbnailExtension});

  factory CharacterDto.fromJSon(dynamic json) => CharacterDto(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    thumbnailPath: json["thumbnail"] == null ? null : json["thumbnail"]["path"],
    thumbnailExtension: json["thumbnail"] == null ? null : json["thumbnail"]["extension"]
  );
}