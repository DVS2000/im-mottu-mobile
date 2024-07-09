class CharacterEntity {
  final int? id;
  final String? name;
  final String? description;
  final String? thumbnailPath;
  final String? thumbnailExtension;

  CharacterEntity({this.id, this.name, this.description, this.thumbnailPath, this.thumbnailExtension});


  String? getUrlImg() {
    if(thumbnailPath == null || thumbnailExtension == null) {
      return null;
    } else {
      return "$thumbnailPath.$thumbnailExtension";
    }
  }
}