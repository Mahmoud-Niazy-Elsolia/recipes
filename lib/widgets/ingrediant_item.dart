import 'package:flutter/material.dart';

import '../constance.dart';

class IngrediantItem extends StatelessWidget {
  final String ingrediant;

  const IngrediantItem({
    super.key,
    required this.ingrediant,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 10,
          width: 10,
          decoration: BoxDecoration(
            color: mainColor,
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(
          width: 25,
        ),
        Text(
          ingrediant,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(color: mainColor, fontSize: 18),
        ),
      ],
    );
  }
}
