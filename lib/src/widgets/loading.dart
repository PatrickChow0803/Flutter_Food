import 'package:flutter/material.dart';
import 'package:flutter_food/src/helpers/style.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SpinKitFoldingCube(
            color: Theme.of(context).primaryColor,
            size: 30.0,
          )
        ],
      ),
    );
  }
}
