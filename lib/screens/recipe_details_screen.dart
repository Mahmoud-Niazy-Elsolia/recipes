import 'package:flutter/material.dart';
import 'package:food_recipes/functions/get_data_from_api.dart';
import 'package:food_recipes/models/recipe_information_model.dart';
import 'package:food_recipes/widgets/recipe_info_item.dart';

class RecipeDetailsScreen extends StatelessWidget {
  final int id;

  const RecipeDetailsScreen({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    Future<RecipeInformationModel> getRecipeInfo() async {
      var data = await getData(
          url:
              'https://api.spoonacular.com/recipes/$id/information?apiKey=7b14c5dbe0cc475dbb393d68ed08d125');
      RecipeInformationModel recipeInfo = RecipeInformationModel.fromJson(data);
      return recipeInfo;
    }

    return FutureBuilder(
      future: getRecipeInfo(),
      builder: (context, snapshot) {
        if(snapshot.hasData){
          return RecipeInfoItem(
            recipeInfo: snapshot.data!,
          );
        }
        if(snapshot.hasError){
          return const Text('Error....');
        }
        return Container(
          color: Colors.white,
          child: const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
