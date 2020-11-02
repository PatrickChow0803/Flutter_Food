import 'package:flutter/material.dart';
import 'file:///C:/Users/Agela/AndroidStudioProjects/Santos-Enoque/food/flutter_food/lib/src/helpers/style.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double size;
  final Color colors;
  final FontWeight weight;

  CustomText({@required this.text, this.size, this.colors, this.weight});

  @override
  Widget build(BuildContext context) {
    // if size variable is null, use size 16
    // if color is null, use black
    // if weight is null, use FontWeight normal
    return Text(
      text,
      style: TextStyle(
        fontSize: size ?? 16,
        color: colors ?? black,
        fontWeight: weight ?? FontWeight.normal,
      ),
    );
  }
}
