import 'package:cloud_firestore/cloud_firestore.dart';

class RestaurantModel {
  // THESE STATIC CONST VARIABLES ARE USED TO REPRESENT THE NAME OF THE FIELD IN FIRESTORE
  // NOT THE DATA
  static const ID = 'id';
  static const NAME = 'name';
  static const AVG_PRICE = 'avgPrice';
  static const RATING = 'rating';
  static const RATES = 'rates';
  static const IMAGE = 'image';
  static const POPULAR = 'popular';

  int _id;
  String _name;
  int _avgPrice;
  int _rating;
  int _rates;
  String _image;
  bool _popular;

  int get id => _id;
  String get name => _name;
  int get avgPrice => _avgPrice;
  int get rating => _rating;
  int get rates => _rates;
  String get image => _image;
  bool get popular => _popular;

  // .fromSnapshot can be anything I want. I'm naming it this because that's the data from firebase
  // Used to convert a a SnapShot into the corresponding model This pulls the data from FireStore
  // and sets the values for each variable
  RestaurantModel.fromSnapshot(DocumentSnapshot snapshot) {
    _id = snapshot.data()[ID];
    _name = snapshot.data()[NAME];
    _avgPrice = snapshot.data()[AVG_PRICE];
    _rating = snapshot.data()[RATING];
    _rates = snapshot.data()[RATES];
    _image = snapshot.data()[IMAGE];
    _popular = snapshot.data()[POPULAR];
  }
}
