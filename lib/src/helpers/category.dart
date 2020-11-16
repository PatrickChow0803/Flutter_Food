import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/category.dart';

class CategoryServices {
  String collection = 'categories';
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<CategoryModel>> getCategories() async =>
      // access firestore -> go to the doc collection table with the name 'categories' in it,
      // and then create an empty list of CategoryModels. Then fill up of the list given the
      // data that's pass back from the get method
      _firestore.collection(collection).get().then((result) {
        List<CategoryModel> categories = [];
        // For each document within the categories collection, add them to the categories list.
        // This essentially is converting a DocumentSnapshot to a CategoryModel and then adding tot he categories list
        for (DocumentSnapshot category in result.docs) {
          categories.add(CategoryModel.fromSnapshot(category));
        }
        return categories;
      });
}
