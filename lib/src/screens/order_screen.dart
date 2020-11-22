import 'package:flutter/material.dart';
import 'package:flutter_food/src/helpers/style.dart';
import 'package:flutter_food/src/providers/app.dart';
import 'package:flutter_food/src/providers/user.dart';
import 'package:flutter_food/src/widgets/custom_text.dart';
import 'package:provider/provider.dart';

class OrdersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
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
    );
  }
}
