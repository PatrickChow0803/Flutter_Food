import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  // THESE STATIC CONST VARIABLES ARE USED TO REPRESENT THE NAME OF THE FIELD IN FIRESTORE
  // NOT THE DATA
  // These variable values should match the variable values inside of auth's sign up method
  static const NAME = 'name';
  static const EMAIL = 'email';
  static const ID = 'id';
  static const LIKED_FOOD = 'likedFood';
  static const LIKED_RESTAURANTS = 'likedRestaurants';

  String _name;
  String _email;
  String _id;
  List _likedFood;
  List _likedRestaurants;

  String get name => _name;
  String get email => _email;
  String get id => _id;
  List get likedFood => _likedFood;
  List get likedRestaurants => _likedRestaurants;

  UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    _name = snapshot.data()[NAME];
    _email = snapshot.data()[EMAIL];
    _id = snapshot.data()[ID];
    // if snapshot.data()[LIKED_FOOD] is null, set _likedFood's list to an empty list
    _likedFood = snapshot.data()[LIKED_FOOD] ?? [];
    _likedRestaurants = snapshot.data()[LIKED_RESTAURANTS] ?? [];
  }
}
