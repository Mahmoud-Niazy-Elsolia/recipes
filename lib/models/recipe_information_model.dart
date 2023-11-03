class RecipeInformationModel {
  final String image;

  final String title;

  final num readyInMinutes;

  final List extendedIngredients;
  final String summary;
  final int id ;

  RecipeInformationModel({
    required this.image,
    required this.title,
    required this.extendedIngredients,
    required this.readyInMinutes,
    required this.summary,
    required this.id,
  });

  factory RecipeInformationModel.fromJson(Map<String, dynamic> json) {
    return RecipeInformationModel(
      image: json['image'],
      title: json['title'],
      extendedIngredients: json['extendedIngredients'],
      readyInMinutes: json['readyInMinutes'],
      summary: json['summary'],
      id:  json['id'],
    );
  }
}
