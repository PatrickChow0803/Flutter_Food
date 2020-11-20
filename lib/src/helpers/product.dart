import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_food/src/models/product.dart';

class ProductServices {
  // Should match letter by letter the document name in Firestore
  String collection = "products";
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<ProductModel>> getProducts() async =>
      // Look in the collection named "products" and return everything in that collection
      _firestore.collection(collection).get().then((result) {
        List<ProductModel> products = [];
        for (DocumentSnapshot product in result.docs) {
          products.add(ProductModel.fromSnapshot(product));
        }
        return products;
      });

  Future<List<ProductModel>> getProductsByRestaurant({int id}) async =>
      // Look in the collection named "products" and return the products where each document's restaurantId field is
      // equal to the restaurantId int that's passed in
      _firestore.collection(collection).where("restaurantId", isEqualTo: id).get().then((result) {
        List<ProductModel> products = [];
        for (DocumentSnapshot product in result.docs) {
          products.add(ProductModel.fromSnapshot(product));
        }
        return products;
      });

  Future<List<ProductModel>> getProductsByCategory({String category}) async =>
      // Look in the collection named "products" and return the products where each document's category field is
      // equal to the category String that's passed in
      _firestore.collection(collection).where("category", isEqualTo: category).get().then((result) {
        List<ProductModel> products = [];
        for (DocumentSnapshot product in result.docs) {
          products.add(ProductModel.fromSnapshot(product));
        }
        return products;
      });

  Future<List<ProductModel>> searchProducts({String productName}) async {
    // Look in the collection named "products", order the documents by the field "name",
    // Return the documents where "name" starts with productName and ends with anything(uf8ff)
    _firestore
        .collection(collection)
        .orderBy("name")
        .startAt([productName])
        .endAt([productName + '\uf8ff'])
        .get()
        .then((result) {
          List<ProductModel> products = [];
          for (DocumentSnapshot product in result.docs) {
            products.add(ProductModel.fromSnapshot(product));
          }
          return products;
        });
  }
}
