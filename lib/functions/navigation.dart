import 'package:flutter/material.dart';

navigate({
  required BuildContext context,
  required Widget screen,
}) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => screen,
    ),
  );
}

navigatePop({
  required BuildContext context,
}){
  Navigator.of(context).pop();
}
