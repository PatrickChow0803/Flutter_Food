import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food/src/helpers/style.dart';
import 'package:flutter_food/src/models/product.dart';
import 'package:flutter_food/src/widgets/custom_text.dart';

class Details extends StatefulWidget {
  final ProductModel product;

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
              child: Stack(
                children: [
                  Carousel(
                    images: [
                      Image.asset('images/${widget.product.image}'),
                      Image.asset('images/${widget.product.image}'),
                      Image.asset('images/${widget.product.image}'),
                    ],
                    dotBgColor: white,
                    dotColor: grey,
                    dotIncreasedColor: red,
                    dotIncreaseSize: 1.2,
                    autoplay: false,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(Icons.keyboard_backspace),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      Stack(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Image.asset(
                              'images/shopping-bag.png',
                              width: 30,
                              height: 30,
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 7,
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(blurRadius: 3, color: Colors.grey, spreadRadius: 1)
                                ],
                              ),
                              child: CircleAvatar(
                                radius: 10,
                                child: CustomText(
                                  text: '2',
                                  color: white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 65,
                    right: 13,
                    child: Container(
                      decoration: BoxDecoration(
//                        shape: BoxShape.circle,
                        color: white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: grey[400],
                            offset: Offset(2, 3),
                            blurRadius: 3,
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.favorite,
                        color: red,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          CustomText(text: widget.product.name, size: 20, weight: FontWeight.bold),
          CustomText(
            text: '\$' + widget.product.price.toString(),
            size: 16,
            weight: FontWeight.w400,
            color: red,
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(icon: Icon(Icons.remove, size: 36), onPressed: () {}),
              GestureDetector(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                    color: red,
                  ),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(24, 12, 24, 12),
                    child: CustomText(text: 'Add To Bag', color: white, size: 20),
                  ),
                ),
              ),
              IconButton(icon: Icon(Icons.add, size: 36, color: red), onPressed: () {}),
            ],
          )
        ],
      ),
    );
  }
}
