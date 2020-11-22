import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class ProductModel {
  // THESE STATIC CONST VARIABLES ARE USED TO REPRESENT THE NAME OF THE FIELD IN FIRESTORE
  // NOT THE DATA
  static const ID = 'id';
  static const NAME = 'name';
  static const RATING = 'rating';
  static const IMAGE = 'image';
  static const PRICE = 'price';
  static const RESTAURANT_ID = 'restaurantId';
  static const RESTAURANT = 'restaurant';
  static const DESCRIPTION = "description";
  static const CATEGORY = 'category';
  static const FEATURED = 'featured';
  static const RATES = "rates";

  String _id;
  String _name;
  int _rating;
  String _image;
  int _price;
  int _restaurantId;
  String _description;
  String _restaurant;
  String _category;
  bool _featured;
  int _rates;

  String get id => _id;
  String get name => _name;
  int get rating => _rating;
  String get image => _image;
  int get price => _price;
  int get restaurantId => _restaurantId;
  String get restaurant => _restaurant;
  String get description => _description;
  String get category => _category;
  bool get featured => _featured;
  int get rates => _rates;

  // public variable
  bool liked = false;

  // .fromSnapshot can be anything I want. I'm naming it this because that's the data from firebase
  // Used to convert a a SnapShot into the corresponding model. This pulls the data from FireStore
  // and sets the values for each variable
  ProductModel.fromSnapshot(DocumentSnapshot snapshot) {
    _id = snapshot.data()[ID];
    _name = snapshot.data()[NAME];
    _rating = snapshot.data()[RATING];
    _image = snapshot.data()[IMAGE];
    _price = snapshot.data()[PRICE].floor();
    _restaurantId = snapshot.data()[RESTAURANT_ID];
    _restaurant = snapshot.data()[RESTAURANT];
    _description = snapshot.data()[DESCRIPTION];
    _featured = snapshot.data()[FEATURED];
    _category = snapshot.data()[CATEGORY];
    _rates = snapshot.data()[RATES];
  }
}
