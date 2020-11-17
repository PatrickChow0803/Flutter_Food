import 'package:flutter/material.dart';
import 'package:flutter_food/src/helpers/style.dart';
import 'package:flutter_food/src/models/restaurant.dart';
import 'package:transparent_image/transparent_image.dart';

import 'custom_text.dart';
import 'loading.dart';

class RestaurantWidget extends StatelessWidget {
  final RestaurantModel restaurant;

  RestaurantWidget({this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Stack(
              children: [
                Positioned.fill(
                    child: Align(
                  alignment: Alignment.center,
                  child: Loading(),
                )),
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image: restaurant.image,
                      fit: BoxFit.fill,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * .30,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Icons.favorite,
                  color: red,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Container(
                    width: 50,
                    decoration:
                        BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5)),
                    child: Row(
                      children: [
                        Padding(
                            padding: EdgeInsets.all(2.0),
                            child: Icon(Icons.star, color: Colors.yellow[900], size: 20.0)),
                        Text(restaurant.rating.toString()),
                      ],
                    )),
              )
            ],
          ),
        ),
        // Positioned.fill occupies all of the space within the stack
        // it is used to be more easy to place widgets
        Positioned.fill(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 100,
              decoration: BoxDecoration(
//                          borderRadius: BorderRadius.only(
//                              bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
                  gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                    Colors.black.withOpacity(.8),
                    Colors.black.withOpacity(.7),
                    Colors.black.withOpacity(.6),
                    Colors.black.withOpacity(.6),
                    Colors.black.withOpacity(.4),
                    Colors.black.withOpacity(.1),
                    Colors.black.withOpacity(.05),
                    Colors.black.withOpacity(.025),
                  ])),
            ),
          ),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(12, 8, 8, 8),
                  child: RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: restaurant.name + "\n",
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      TextSpan(
                          text: "Average meal price: \$",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal)),
                      TextSpan(
                          text: restaurant.avgPrice.toString() + "\n",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal)),
                    ]),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
