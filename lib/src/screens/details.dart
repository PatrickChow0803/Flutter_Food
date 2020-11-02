import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food/src/helpers/style.dart';
import 'package:flutter_food/src/models/product.dart';

class Details extends StatefulWidget {
  final Product product;

  Details({@required this.product});

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Column(
        children: [
          SafeArea(
            child: Container(
              height: 300,
              child: Carousel(
                images: [
                  Image.asset('images/${widget.product.image}'),
                  Image.asset('images/${widget.product.image}'),
                  Image.asset('images/${widget.product.image}'),
                ],
                dotBgColor: white,
                dotColor: grey,
                dotIncreasedColor: red,
                dotIncreaseSize: 1.2,
              ),
            ),
          )
        ],
      ),
    );
  }
}
