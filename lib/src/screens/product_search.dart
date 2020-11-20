import 'package:flutter/material.dart';
import 'package:flutter_food/src/helpers/style.dart';
import 'package:flutter_food/src/models/product.dart';
import 'package:flutter_food/src/providers/product.dart';
import 'package:flutter_food/src/widgets/custom_text.dart';
import 'package:flutter_food/src/widgets/product.dart';
import 'package:provider/provider.dart';

class ProductSearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
        backgroundColor: white,
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {})],
        title: Text("Products"),
      ),
      body: productProvider.productsSearched.length < 1
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.search, color: grey, size: 30),
                CustomText(
                  text: 'No Products Found',
                  color: grey[300],
                  size: 25,
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (_, index) {
                return ProductWidget(product: productProvider.productsSearched[index]);
              },
              itemCount: productProvider.productsSearched.length,
            ),
    );
  }
}
