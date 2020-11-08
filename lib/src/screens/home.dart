import 'package:flutter/material.dart';
import 'package:flutter_food/src/helpers/screen_navigation.dart';
import 'package:flutter_food/src/providers/auth.dart';
import 'package:flutter_food/src/widgets/bottom_navigation_icons.dart';
import 'package:flutter_food/src/widgets/categories.dart';
import 'package:flutter_food/src/widgets/custom_text.dart';
import 'package:flutter_food/src/widgets/featured_products.dart';
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
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: white),
        elevation: 0.0,
        backgroundColor: Theme.of(context).primaryColor,
        title: CustomText(
          text: 'Food App',
          size: 18,
          colors: white,
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
              text: authProvider.userModel.name,
              colors: white,
            ),
            accountEmail: Opacity(
              opacity: 0.8,
              child: CustomText(
                text: authProvider.userModel.email,
                colors: white,
              ),
            ),
            decoration: BoxDecoration(color: Theme.of(context).primaryColor),
          ),
          ListTile(
            title: CustomText(
              text: "Home",
            ),
            leading: Icon(Icons.home),
            onTap: () {},
          ),
          ListTile(
            title: CustomText(
              text: "Account",
            ),
            leading: Icon(Icons.person),
            onTap: () {},
          ),
          ListTile(
            title: CustomText(
              text: "Cart",
            ),
            leading: Icon(Icons.shopping_cart),
            onTap: () {
              changeScreen(context, ShoppingBag());
            },
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
            Categories(),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: CustomText(
                text: "Featured Food",
                size: 20.0,
                colors: grey,
              ),
            ),
            // Displays the featured foods
            Featured(),

            Padding(
              padding: EdgeInsets.all(8.0),
              child: CustomText(text: "Popular", size: 20.0, colors: grey),
            ),

            Stack(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image.asset('images/food.jpg')),
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
                            decoration: BoxDecoration(
                                color: Colors.white, borderRadius: BorderRadius.circular(5)),
                            child: Row(
                              children: [
                                Padding(
                                    padding: EdgeInsets.all(2.0),
                                    child: Icon(Icons.star, color: Colors.yellow[900], size: 20.0)),
                                Text("4.5"),
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
                                  text: "Pancakes \n",
                                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text: "by: ",
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal)),
                              TextSpan(
                                  text: "Pizza Hut \n",
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal)),
                            ]),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(16.0),
                          child: CustomText(
                            text: "\$12.99",
                            colors: Colors.white,
                            size: 25.0,
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
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
