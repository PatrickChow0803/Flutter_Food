import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/restaurant.dart';

class RestaurantService {
  // Should match letter by letter the document name in Firestore
  String collection = 'restaurants';
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<RestaurantModel>> getRestaurants() async =>
      // access firestore -> go to the doc collection table with the name 'restaurants' in it,
      // and then create an empty list of RestaurantModel. Then fill up of the list given the
      // data that's pass back from the get method
      _firestore.collection(collection).get().then((result) {
        List<RestaurantModel> restaurants = [];
        // For each document within the restaurant collection, add them to the restaurants list.
        // This essentially is converting a DocumentSnapshot to a RestaurantModel and then adding tot he restaurants list
        for (DocumentSnapshot restaurant in result.docs) {
          restaurants.add(RestaurantModel.fromSnapshot(restaurant));
        }
        return restaurants;
      });
}
