import 'package:flutter/material.dart';
import 'package:flutter_food/src/helpers/screen_navigation.dart';
import 'package:flutter_food/src/models/category.dart';
import 'package:flutter_food/src/providers/app.dart';
import 'package:flutter_food/src/providers/product.dart';
import 'package:flutter_food/src/screens/category.dart';
import 'package:flutter_food/src/widgets/loading.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

import '../helpers/style.dart';
import 'custom_text.dart';

class CategoryWidget extends StatelessWidget {
  final CategoryModel category;

  CategoryWidget({this.category});

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    final appProvider = Provider.of<AppProvider>(context);
    return GestureDetector(
      onTap: () async {
//        appProvider.changeLoading();
        await productProvider.loadProductsByCategory(categoryName: category.name);
//        appProvider.changeLoading();
        changeScreen(context, CategoryScreen(categoryModel: category));
      },
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: Stack(
          children: <Widget>[
            Container(
              width: 140,
              height: 160,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Stack(
                    children: [
                      Positioned.fill(
                          child: Align(
                        alignment: Alignment.center,
                        child: Loading(),
                      )),
                      Center(
                        child: FadeInImage.memoryNetwork(
                          placeholder: kTransparentImage,
                          image: category.image,
                          fit: BoxFit.fill,
                          // Have to make the width and height match the container in order for the
                          // fit to work properly
                          width: 140,
                          height: 160,
                        ),
                      ),
                    ],
                  )),
            ),
            Container(
              width: 140,
              height: 160,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.black.withOpacity(0.6),
                      Colors.black.withOpacity(0.6),
                      Colors.black.withOpacity(0.4),
                      Colors.black.withOpacity(0.1),
                      Colors.black.withOpacity(0.05),
                      Colors.black.withOpacity(0.025),
                    ],
                  )),
            ),
            Positioned.fill(
                child: Align(
                    alignment: Alignment.center,
                    child: CustomText(
                      text: category.name,
                      color: white,
                      size: 26,
                      weight: FontWeight.w300,
                    )))
          ],
        ),
      ),
    );
  }
}
