import 'package:flutter/material.dart';
import 'package:food_recipes/db/sqflite_db.dart';
import 'package:food_recipes/functions/navigation.dart';
import 'package:food_recipes/models/recipe_information_model.dart';
import 'package:food_recipes/screens/layout.dart';

import '../constance.dart';
import 'ingrediant_item.dart';

class RecipeInfoItem extends StatefulWidget {
  final RecipeInformationModel recipeInfo;


  RecipeInfoItem({
    super.key,
    required this.recipeInfo,
  });

  @override
  State<RecipeInfoItem> createState() => _RecipeInfoItemState();
}

class _RecipeInfoItemState extends State<RecipeInfoItem> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    bool isFav = ids.contains(widget.recipeInfo.id);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            navigatePop(context: context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: mainColor,
            size: 25,
          ),
        ),
        actions: [
          IconButton(
            onPressed: ()async {
              if(isFav){
                setState(() {
                   SqfliteDb().deleteData(id: widget.recipeInfo.id);
                });
                navigatePop(context: context);
              }
              else{
                setState(() {
                   SqfliteDb().insertData(
                    id: widget.recipeInfo.id,
                    title: widget.recipeInfo.title,
                    image: widget.recipeInfo.image,
                  );
                });
              }

            },
            icon: Icon(
              Icons.favorite,
              size: 25,
              color: isFav ? Colors.red : Colors.grey,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          const Icon(
            Icons.shopping_cart_outlined,
            size: 25,
          ),
          const SizedBox(
            width: 10,
          ),
          const Icon(
            Icons.share,
            size: 25,
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: screenHeight * .35,
              child: Image.network(
                widget.recipeInfo.image,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.recipeInfo.title,
                    style: TextStyle(
                      fontSize: 24,
                      color: mainColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Divider(color: Colors.black12),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: Center(
                            child: Text(
                              'Easy',
                              style: TextStyle(
                                fontSize: 18,
                                color: mainColor,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Icon(
                                Icons.watch_later_outlined,
                                color: mainColor,
                              ),
                              Text(
                                '${widget.recipeInfo.readyInMinutes}',
                                style:
                                    TextStyle(color: mainColor, fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Text('${widget.recipeInfo.extendedIngredients.length}',
                                  style: TextStyle(
                                      color: mainColor,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500)),
                              Text(
                                'Ingrediant',
                                style:
                                    TextStyle(color: mainColor, fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(color: Colors.black12),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    widget.recipeInfo.summary,
                    style: TextStyle(
                      fontSize: 16,
                      color: mainColor,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Divider(
                    color: Colors.black12,
                  ),
                  Text(
                    'Ingrediant',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: mainColor,
                    ),
                  ),
                  const Divider(
                    color: Colors.black12,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return IngrediantItem(
                        ingrediant: widget.recipeInfo.extendedIngredients[index]
                            ['name'],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 10,
                      );
                    },
                    itemCount: widget.recipeInfo.extendedIngredients.length,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
