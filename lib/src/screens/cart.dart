import 'package:flutter/material.dart';
import 'package:flutter_food/src/helpers/style.dart';
import 'package:flutter_food/src/models/product.dart';
import 'package:flutter_food/src/providers/user.dart';
import 'package:flutter_food/src/widgets/custom_text.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      key: _key,
      backgroundColor: white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: black),
        backgroundColor: white,
        elevation: 0.0,
        title: CustomText(
          text: "Shopping Cart",
        ),
        leading: IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: ListView.builder(
        itemCount: userProvider.userModel.cart.length,
        itemBuilder: (_, index) {
          return Padding(
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.network(
                    userProvider.userModel.cart[index].image,
                    fit: BoxFit.fill,
                    width: 50,
                  ),
                  // Use RichText for multiple lines of text
                  Padding(
                    padding: EdgeInsets.only(right: 125),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: userProvider.userModel.cart[index].name + '\n',
                            style: TextStyle(color: black, fontSize: 20),
                          ),
                          TextSpan(
                            text: userProvider.userModel.cart[index].price.toString(),
                            style: TextStyle(color: black, fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                  IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () async {
                        bool value = await userProvider.removeFromCart(
                            cartItem: userProvider.userModel.cart[index]);

                        if (value) {
                          _key.currentState
                              .showSnackBar(SnackBar(content: Text("Removed from Cart!")));
                          userProvider.reloadUserModel();
                          return;
                        } else {
                          print("Item was not removed");
                        }
                      })
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
