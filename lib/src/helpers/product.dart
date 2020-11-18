import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_food/src/models/product.dart';

class ProductServices {
  // Should match letter by letter the document name in Firestore
  String collection = "products";
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<ProductModel>> getProducts() async =>
      _firestore.collection(collection).get().then((result) {
        List<ProductModel> products = [];
        for (DocumentSnapshot product in result.docs) {
          products.add(ProductModel.fromSnapshot(product));
        }
        return products;
      });
}
