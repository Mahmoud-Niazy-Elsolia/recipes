import 'package:flutter/material.dart';
import 'package:food_recipes/db/sqflite_db.dart';

import '../widgets/recipe_item.dart';

class FavouritesScreen extends StatelessWidget{
  const FavouritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var sqflite = SqfliteDb();
    double screenWidth = MediaQuery.of(context).size.width;
    return FutureBuilder(
      future: sqflite.getData(),
      builder: (context, snapshot) {
        if(snapshot.hasError){
          print(snapshot.error);
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
                    title: snapshot.data![index]['title'],
                    image: snapshot.data![index]['image'],
                    id: snapshot.data![index]['id'],
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