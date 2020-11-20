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

  Future<RestaurantModel> getRestaurantById({int id}) =>
      _firestore.collection(collection).doc(id.toString()).get().then((doc) {
        return RestaurantModel.fromSnapshot(doc);
      });

  Future<List<RestaurantModel>> searchRestaurant({String restaurantName}) async {
    // Because the products in FireStore start with an upper case letter, I need to convert the passed in string to ensure that the first letter is upper case.
    String searchKey = restaurantName[0].toUpperCase() + restaurantName.substring(1);
    // Look in the collection named "restaurants", order the documents by the field "name",
    // Return the documents where "name" starts with restaurantName and ends with anything(uf8ff)
    return _firestore
        .collection(collection)
        .orderBy("name")
        .startAt([searchKey])
        .endAt([searchKey + '\uf8ff'])
        .get()
        .then((result) {
          List<RestaurantModel> restaurants = [];
          for (DocumentSnapshot restaurant in result.docs) {
            restaurants.add(RestaurantModel.fromSnapshot(restaurant));
          }
          return restaurants;
        });
  }
}
