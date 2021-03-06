import 'package:flutter/material.dart';
import 'package:flutter_food/src/models/product.dart';
import '../helpers/product.dart';

class ProductProvider with ChangeNotifier {
  ProductServices _productServices = ProductServices();
  List<ProductModel> products = [];
  List<ProductModel> productsByCategory = [];
  List<ProductModel> productsByRestaurant = [];
  List<ProductModel> productsSearched = [];

  ProductProvider.initialize() {
    _loadProducts();
//    searchProducts(productName: "Pizza");
  }

  Future<void> _loadProducts() async {
    products = await _productServices.getProducts();
    notifyListeners();
  }

  Future loadProductsByCategory({String categoryName}) async {
    productsByCategory = await _productServices.getProductsByCategory(category: categoryName);
    notifyListeners();
  }

  Future loadProductsByRestaurant({int restaurantId}) async {
    productsByRestaurant = await _productServices.getProductsByRestaurant(id: restaurantId);
    notifyListeners();
  }

  Future searchProducts({String productName}) async {
    productsSearched = await _productServices.searchProducts(productName: productName);
    print("Products: " + "${productsSearched.length}");
    notifyListeners();
  }
}
