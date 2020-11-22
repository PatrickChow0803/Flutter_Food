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
          text: "Total Price: \$${userProvider.userModel.totalCartPrice.toString()}",
          size: 20,
        ),
        leading: IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            }),
        actions: [
          Center(
              child: Padding(
                  padding: EdgeInsets.only(right: 16),
                  child: GestureDetector(
                    onTap: () {
                      if (userProvider.userModel.totalCartPrice == 0) {
                        _key.currentState.showSnackBar(SnackBar(content: Text("Cart is empty")));
                        return;
                      }
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Dialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)), //this right here
                              child: Container(
                                height: 200,
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      CustomText(
                                          text:
                                              "You will be charged \$${userProvider.userModel.totalCartPrice} upon delivery"),
                                      SizedBox(
                                        width: 320.0,
                                        child: RaisedButton(
                                          onPressed: () {},
                                          child: Text(
                                            "Accept",
                                            style: TextStyle(color: Colors.white),
                                          ),
                                          color: Theme.of(context).primaryColor,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 320.0,
                                        child: RaisedButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text(
                                            "Reject",
                                            style: TextStyle(color: Colors.white),
                                          ),
                                          color: red,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          });
                    },
                    child: CustomText(
                      text: 'Pay Now',
                      color: Theme.of(context).primaryColor,
                      size: 20,
                    ),
                  )))
        ],
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
                      }),
                ],
              ),
            ),
          );
        },
      ),
//      bottomNavigationBar: Container(
//        height: 70,
//        child: Text("Total Price: ${userProvider.userModel.totalCartPrice.toString()}"),
//      ),
    );
  }
}
