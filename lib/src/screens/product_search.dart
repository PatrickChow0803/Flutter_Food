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
          text: "Products",
          size: 20,
          color: Theme.of(context).primaryColor,
        ),
      ),
      body: productProvider.productsSearched.length < 1
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.search, color: grey, size: 100),
                  SizedBox(
                    height: 15.0,
                  ),
                  CustomText(
                    text: 'No Products Found',
                    color: grey[300],
                    size: 30,
                  ),
                ],
              ),
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
