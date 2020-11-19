import 'package:flutter/material.dart';
import 'package:flutter_food/src/helpers/screen_navigation.dart';
import 'package:flutter_food/src/providers/category.dart';
import 'package:flutter_food/src/providers/product.dart';
import 'package:flutter_food/src/providers/restaurant.dart';
import 'package:flutter_food/src/providers/user.dart';
import 'package:flutter_food/src/screens/category.dart';
import 'package:flutter_food/src/widgets/bottom_navigation_icons.dart';
import 'package:flutter_food/src/widgets/categories.dart';
import 'package:flutter_food/src/widgets/custom_text.dart';
import 'package:flutter_food/src/widgets/featured_products.dart';
import 'package:flutter_food/src/widgets/restaurant.dart';
import 'package:provider/provider.dart';
import '../helpers/style.dart';
import 'bag.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final categoryProvider = Provider.of<CategoryProvider>(context);
    final restaurantProvider = Provider.of<RestaurantProvider>(context);
    final productProvider = Provider.of<ProductProvider>(context);

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: white),
        elevation: 0.0,
        backgroundColor: Theme.of(context).primaryColor,
        title: CustomText(
          text: 'Food App',
          size: 18,
          color: white,
          weight: FontWeight.bold,
        ),
        actions: [
          Stack(
            children: [
              // moves the container(red dot) within the stack widget
              Positioned(
                top: 12.0,
                right: 12.0,
                child: Container(
                  width: 10.0,
                  height: 10.0,
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
              IconButton(
                  icon: Icon(Icons.shopping_cart),
                  onPressed: () {
                    changeScreen(context, ShoppingBag());
                  })
            ],
          ),
          Stack(
            children: [
              // moves the container(red dot) within the stack widget
              Positioned(
                top: 12.0,
                right: 12.0,
                child: Container(
                  width: 10.0,
                  height: 10.0,
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
              IconButton(icon: Icon(Icons.notifications_none), onPressed: () {})
            ],
          )
        ],
      ),
      drawer: Drawer(
          child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: CustomText(
              text: userProvider.userModel.name,
              color: white,
            ),
            accountEmail: Opacity(
              opacity: 0.8,
              child: CustomText(
                text: userProvider.userModel.email,
                color: white,
              ),
            ),
            decoration: BoxDecoration(color: Theme.of(context).primaryColor),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(Icons.home),
            title: CustomText(text: "Home"),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(Icons.shopping_cart),
            title: CustomText(text: "Cart"),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(Icons.fastfood),
            title: CustomText(text: "Favorite Food"),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(Icons.restaurant),
            title: CustomText(text: "Liked restaurants"),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(Icons.bookmark_border),
            title: CustomText(text: "Past orders"),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(Icons.settings),
            title: CustomText(text: "Settings"),
          ),
        ],
      )),
      backgroundColor: white,
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              decoration: (BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16.0),
                    bottomRight: Radius.circular(16.0),
                  ))),
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(18.0),
                      boxShadow: [
                        BoxShadow(
                          color: grey[400],
                          offset: Offset(1, 1),
                          blurRadius: 4,
                        ),
                      ]),
                  child: ListTile(
                    leading: Icon(
                      Icons.search,
                      color: Theme.of(context).primaryColor,
                    ),
                    title: TextField(
                      decoration: InputDecoration(
                        hintText: 'Find food or restaurants',
                        border: InputBorder.none,
                      ),
                    ),
                    trailing: Icon(
                      Icons.filter_list,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 5.0),
            Container(
              height: 100,
              child: ListView.builder(
                itemCount: categoryProvider.categories.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) {
                  return CategoryWidget(
                    category: categoryProvider.categories[index],
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CustomText(
                    text: "Featured Food",
                    size: 20.0,
                    color: grey,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomText(
                    text: 'See All',
                    color: Theme.of(context).primaryColor,
                  ),
                )
              ],
            ),
            // Displays the featured foods
            Featured(),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CustomText(text: "Popular Restaurants", size: 20.0, color: grey),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomText(
                    text: 'Show All',
                    color: Theme.of(context).primaryColor,
                  ),
                )
              ],
            ),
            Column(
              children: restaurantProvider.restaurants
                  .map((item) => GestureDetector(
                        onTap: () {},
                        child: RestaurantWidget(
                          restaurant: item,
                        ),
                      ))
                  .toList(),
            )
          ],
        ),
      ),
//      BOTTOM NAVIGATION BAR'S FUNCTIONALITY HAS BEEN MOVED TO THE DRAWER
//      bottomNavigationBar: Container(
//        color: white,
//        child: Row(
//          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//          children: [
//            BottomNavIcon(image: 'home.png'),
//            BottomNavIcon(
//              image: 'shopping-bag.png',
//              onTap: () {
//                changeScreen(context, ShoppingBag());
//              },
//            ),
//            BottomNavIcon(
//              image: 'avatar.png',
//              onTap: () {
//                authProvider.signOut();
//              },
//            ),
//          ],
//        ),
//      ),
    );
  }
}
