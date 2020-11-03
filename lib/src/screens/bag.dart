import 'package:flutter/material.dart';
import 'package:flutter_food/src/helpers/style.dart';
import 'package:flutter_food/src/models/product.dart';
import 'package:flutter_food/src/widgets/custom_text.dart';

class ShoppingBag extends StatefulWidget {
  @override
  _ShoppingBagState createState() => _ShoppingBagState();
}

class _ShoppingBagState extends State<ShoppingBag> {
  Product product = Product(
    name: 'Cereal',
    price: 5.99,
    rating: 4.2,
    vendor: "GoodFoos",
    wishList: true,
    image: "1.jpg",
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: white,
        elevation: 0,
        // Makes the back arrow visible within the app bar
        iconTheme: IconThemeData(color: black),
        title: CustomText(
          text: "Shopping Bag",
          weight: FontWeight.bold,
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    'images/shopping-bag.png',
                    width: 30,
                  ),
                ),
                Positioned(
                  bottom: 4,
                  right: 4,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      boxShadow: [BoxShadow(blurRadius: 3, color: Colors.grey, spreadRadius: 1)],
                    ),
                    child: CircleAvatar(
                      radius: 10,
                      child: CustomText(
                        text: '2',
                        colors: white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              height: 120,
              decoration: BoxDecoration(color: white, boxShadow: [
                BoxShadow(
                  color: red[50],
                  offset: Offset(3, 5),
                  blurRadius: 30,
                )
              ]),
              child: Text('Testing'),
            ),
          )
        ],
      ),
    );
  }
}
