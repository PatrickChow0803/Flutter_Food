import 'package:flutter/material.dart';

class BottomNavIcon extends StatelessWidget {
  final String image;
  final Function onTap;

  BottomNavIcon({this.image, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? null,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Image.asset('images/$image', width: 26, height: 26),
      ),
    );
  }
}
