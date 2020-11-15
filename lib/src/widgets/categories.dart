import 'package:flutter/material.dart';
import 'package:flutter_food/src/models/category.dart';

import '../helpers/style.dart';
import 'custom_text.dart';

List<CategoryModel> categoriesList = [];

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 105,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoriesList.length,
        itemBuilder: (_, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: white,
                    boxShadow: [
                      BoxShadow(
                        color: red[50],
                        offset: Offset(4, 6),
                        blurRadius: 12,
                      ),
                    ],
                  ),
                  child: Padding(
                      padding: EdgeInsets.all(6.0),
                      child: Image.asset(
                        'images/${categoriesList[index].image}',
                        width: 50,
                      )),
                ),
                SizedBox(height: 10),
                CustomText(
                  text: categoriesList[index].name,
                  size: 14,
                  colors: black,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
