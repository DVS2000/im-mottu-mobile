class CharacterEntity {
  final String? name;
  final String? description;
  final String? thumbnail;
  final String? thumbnailExtension;
  final List<CharacterEntity> recommendedList;

  CharacterEntity(this.name, this.description, this.thumbnail, this.thumbnailExtension, this.recommendedList);


  String? getUrlImg() {
    if(thumbnail == null || thumbnailExtension == null) {
      return null;
    } else {
      return "$thumbnail.$thumbnailExtension";
    }
  }
}