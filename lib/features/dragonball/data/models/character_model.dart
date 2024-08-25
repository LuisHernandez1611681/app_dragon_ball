class CharacterModel {
  final String name;
  final String imageUrl;

  CharacterModel({
    required this.name, 
    required this.imageUrl
  });

  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    return CharacterModel(
      name: json['name'] as String, 
      imageUrl: json['image'] as String
    );
  }
}