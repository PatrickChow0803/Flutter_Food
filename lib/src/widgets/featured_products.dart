import 'package:flutter/material.dart';
import 'package:flutter_food/src/helpers/screen_navigation.dart';
import 'package:flutter_food/src/models/product.dart';
import 'package:flutter_food/src/providers/product.dart';
import 'package:flutter_food/src/screens/details.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

import '../helpers/style.dart';
import 'custom_text.dart';
import 'loading.dart';

class Featured extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productsList = Provider.of<ProductProvider>(context);

    return Container(
      height: 230,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: productsList.products.length,
          itemBuilder: (_, index) {
            return Padding(
              padding: EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  // pass in the product that was clicked on as the parameter
                  changeScreen(_, Details(product: productsList.products[index]));
                },
                child: Container(
                    height: 160,
                    width: 200,
                    decoration: BoxDecoration(color: white, boxShadow: [
                      BoxShadow(
                        color: red[50],
                        offset: Offset(15, 5),
                        blurRadius: 30,
                      ),
                    ]),
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Positioned.fill(
                                child: Align(
                              alignment: Alignment.center,
                              child: Loading(),
                            )),
                            ClipRRect(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(40), topRight: Radius.circular(40)),
                              child: Center(
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  child: FadeInImage.memoryNetwork(
                                    placeholder: kTransparentImage,
                                    image: productsList.products[index].image,
                                    fit: BoxFit.fill,
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height * .20,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                                padding: EdgeInsets.all(8.0),
                                child: CustomText(text: productsList.products[index].name)),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.0),
                                    color: white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: grey[300],
                                        offset: Offset(1, 1),
                                        blurRadius: 4,
                                      ),
                                    ]),
//                                child: Padding(
//                                    padding: EdgeInsets.all(4.0),
//                                    child: productsList[index].wishList
//                                        ? Icon(
//                                            Icons.favorite,
//                                            color: red,
//                                          )
//                                        : Icon(
//                                            Icons.favorite_border,
//                                            color: red,
//                                          )),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  CustomText(
                                      text: productsList.products[index].rating.toString(),
                                      colors: grey,
                                      size: 14),
                                  SizedBox(width: 4.0),
                                  Icon(Icons.star, size: 18, color: red),
                                  Icon(Icons.star, size: 18, color: red),
                                  Icon(Icons.star, size: 18, color: red),
                                  Icon(Icons.star, size: 18, color: red),
                                  Icon(Icons.star, size: 18, color: grey),
                                ],
                              ),
                              Padding(
                                  padding: EdgeInsets.only(right: 8.0),
                                  child: CustomText(
                                    text: "\$${productsList.products[index].price}",
                                    weight: FontWeight.bold,
                                  ))
                            ],
                          ),
                        )
                      ],
                    )),
              ),
            );
          }),
    );
  }
}
