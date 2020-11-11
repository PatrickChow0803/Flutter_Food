import 'package:cloud_firestore/cloud_firestore.dart';

class RestaurantModel {
  // THESE STATIC CONST VARIABLES ARE USED TO REPRESENT THE NAME OF THE FIELD IN FIRESTORE
  // NOT THE DATA
  static const ID = 'id';
  static const NAME = 'name';
  static const AVG_PRICE = 'avgPrice';
  static const RATING = 'rating';
  static const IMAGE = 'image';
  static const POPULAR = 'popular';

  String _id;
  String _name;
  double _avgPrice;
  double _rating;
  String _image;
  bool _popular;

  String get id => _id;
  String get name => _name;
  double get avgPrice => _avgPrice;
  double get rating => _rating;
  String get image => _image;
  bool get popular => _popular;

  // .fromSnapshot can be anything I want. I'm naming it this because that's the data from firebase
  RestaurantModel.fromSnapshot(DocumentSnapshot snapshot) {
    _id = snapshot.data()[ID];
    _name = snapshot.data()[NAME];
    _avgPrice = snapshot.data()[AVG_PRICE];
    _rating = snapshot.data()[RATING];
    _image = snapshot.data()[IMAGE];
    _popular = snapshot.data()[POPULAR];
  }
}
