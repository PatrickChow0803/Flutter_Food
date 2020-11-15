import 'package:cloud_firestore/cloud_firestore.dart';

class OrderModel {
  // THESE STATIC CONST VARIABLES ARE USED TO REPRESENT THE NAME OF THE FIELD IN FIRESTORE
  // NOT THE DATA
  static const ID = 'id';
  static const NAME = 'name';
  static const PRODUCT_ID = 'productId';
  static const PRICE = 'price';
  static const STATUS = 'status';

  String _id;
  String _name;
  String _productId;
  double _price;
  String _status;

  String get Id => _id;
  String get name => _name;
  String get productId => _productId;
  double get price => _price;
  String get status => _status;

  // .fromSnapshot can be anything I want. I'm naming it this because that's the data from firebase
  OrderModel.fromSnapshot(DocumentSnapshot snapshot) {
    _id = snapshot.data()[ID];
    _name = snapshot.data()[NAME];
    _productId = snapshot.data()[PRODUCT_ID];
    _price = snapshot.data()[PRICE];
    _status = snapshot.data()[STATUS];
  }
}
