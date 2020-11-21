import 'package:flutter/material.dart';
import 'package:flutter_food/src/helpers/style.dart';
import 'package:flutter_food/src/providers/restaurant.dart';
import 'package:flutter_food/src/widgets/custom_text.dart';
import 'package:flutter_food/src/widgets/product.dart';
import 'package:flutter_food/src/widgets/restaurant.dart';
import 'package:provider/provider.dart';

class RestaurantSearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final restaurantProvider = Provider.of<RestaurantProvider>(context);

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
        backgroundColor: white,
        centerTitle: true,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {})],
        title: CustomText(
          text: "Restaurants",
          size: 20,
          color: Theme.of(context).primaryColor,
        ),
      ),
      body: restaurantProvider.searchedRestaurants.length < 1
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.search, color: grey, size: 100),
                  SizedBox(
                    height: 15.0,
                  ),
                  CustomText(
                    text: 'No Restaurants Found',
                    color: grey[300],
                    size: 30,
                  ),
                ],
              ),
            )
          : ListView.builder(
              itemBuilder: (_, index) {
                return RestaurantWidget(restaurant: restaurantProvider.searchedRestaurants[index]);
              },
              itemCount: restaurantProvider.searchedRestaurants.length,
            ),
    );
  }
}
