class RandomRecipeModel {
  String title;
  String image;
  int id;

  RandomRecipeModel({
    required this.id,
    required this.title,
    required this.image,
  });

  factory RandomRecipeModel.fromJson(Map<String, dynamic> json) =>
      RandomRecipeModel(
        id: json['id'],
        title: json['title'],
        image:json['image'],
      );
}
