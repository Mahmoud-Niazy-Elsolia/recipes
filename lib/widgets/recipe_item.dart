import 'package:flutter/material.dart';
import 'package:food_recipes/functions/navigation.dart';
import 'package:food_recipes/screens/recipe_details_screen.dart';

class RecipeItem extends StatelessWidget {
  final String title;
  final int id ;
  final String image;

  const RecipeItem({
    super.key,
    required this.title,
    required this.image,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        navigate(
          context: context,
          screen: RecipeDetailsScreen(
            id: id,
          ),
        );
      },
      child: SizedBox(
        height: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                Container(
                  height: 150,
                  width: screenWidth * .4,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Image.network(
                    image,
                    fit: BoxFit.cover,
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.all(5),
                //   child: Container(
                //     width: screenWidth * .09,
                //     decoration: const BoxDecoration(
                //         shape: BoxShape.circle, color: Colors.white),
                //     child: Center(
                //       child: IconButton(
                //         onPressed: () {},
                //         icon: const Icon(
                //           Icons.favorite,
                //           size: 20,
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
