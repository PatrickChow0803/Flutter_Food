import 'package:flutter/material.dart';

class BottomNavIcon extends StatelessWidget {
  final String image;

  BottomNavIcon({this.image});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Image.asset('images/$image', width: 26, height: 26),
    );
  }
}
