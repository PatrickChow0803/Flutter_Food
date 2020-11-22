import 'package:flutter/material.dart';
import 'package:flutter_food/src/helpers/style.dart';
import 'package:flutter_food/src/models/order.dart';
import 'package:flutter_food/src/providers/app.dart';
import 'package:flutter_food/src/providers/user.dart';
import 'package:flutter_food/src/widgets/custom_text.dart';
import 'package:provider/provider.dart';

class OrdersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final app = Provider.of<AppProvider>(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: black),
        backgroundColor: white,
        elevation: 0.0,
        title: CustomText(text: "Orders"),
        leading: IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      backgroundColor: white,
      body: ListView.builder(
          itemCount: userProvider.orders.length,
          itemBuilder: (_, index) {
            // loop through all of the user orders and create a ListTile for each order
            OrderModel _order = userProvider.orders[index];
            return ListTile(
              leading: CustomText(
                text: "\$${_order.total}",
                weight: FontWeight.bold,
              ),
              title: Text(_order.description),
              subtitle: Text(DateTime.fromMillisecondsSinceEpoch(_order.createdAt).toString()),
              trailing: CustomText(
                text: _order.status,
                color: Colors.green,
              ),
            );
          }),
    );
  }
}
