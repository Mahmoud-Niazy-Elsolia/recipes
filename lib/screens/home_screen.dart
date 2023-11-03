import 'package:flutter/material.dart';
import 'package:food_recipes/functions/get_data_from_api.dart';
import 'package:food_recipes/models/random_recipe_model.dart';
import 'package:food_recipes/widgets/recipe_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static List<RandomRecipeModel> randomRecipes = [];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    Future<List<RandomRecipeModel>> getRandomRecipes() async {
      if(randomRecipes.isEmpty){
        final data = await getData(
            url: 'https://api.spoonacular.com/recipes/random?apiKey=7b14c5dbe0cc475dbb393d68ed08d125&number=10');
        for (var recipe in data['recipes']) {
          randomRecipes.add(RandomRecipeModel.fromJson(recipe));
        }
      }
      return randomRecipes;
    }

    return FutureBuilder(
      future: getRandomRecipes(),
      builder: (context, snapshot) {
        if(snapshot.hasError){
          return const Text('Error');
        }
        if(snapshot.hasData){
          return Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 20
            ),
            child: Container(
              padding: const EdgeInsets.only(
                top: 20,
                bottom: 20,
              ),
              child:
              GridView.builder(
                itemCount: snapshot.data!.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.4/2,
                    crossAxisSpacing: screenWidth *.1
                ),
                itemBuilder: (context,index){
                  return RecipeItem(
                    title: snapshot.data![index].title,
                    image: snapshot.data![index].image,
                    id: snapshot.data![index].id,
                  );
                },
              ),
            ),
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );

  }
}
