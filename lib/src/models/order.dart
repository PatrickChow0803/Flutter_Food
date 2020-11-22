import 'package:cloud_firestore/cloud_firestore.dart';

class OrderModel {
  // THESE STATIC CONST VARIABLES ARE USED TO REPRESENT THE NAME OF THE FIELDS IN FIRESTORE
  // NOT THE DATA. THEIR VALUES SHOULD BE THE EXACT SAME AS THE CREATE METHODS IN THE HELPER FILE
  static const ID = 'id';
  static const DESCRIPTION = 'description';
  static const CART = 'cart';
  static const USER_ID = 'userId';
  static const TOTAL = 'total';
  static const STATUS = 'status';
  static const CREATED_AT = 'createdAt';

  String _id;
  String _description;
  List cart;
  String _userId;
  int _total;
  String _status;
  int _createdAt;

  // ONLY NEED TO USE THESE GETTERS FOR PRIVATE FIELDS
  String get id => _id;
  String get description => _description;
  String get userId => _userId;
  int get total => _total;
  String get status => _status;
  int get createdAt => _createdAt;

  // .fromSnapshot can be anything I want. I'm naming it this because that's the data from firebase
  // Used to convert a a SnapShot into the corresponding model. This pulls the data from FireStore
  // and sets the values for each variable
  OrderModel.fromSnapshot(DocumentSnapshot snapshot) {
    _id = snapshot.data()[ID];
    _description = snapshot.data()[DESCRIPTION];
    _userId = snapshot.data()[USER_ID];
    _total = snapshot.data()[TOTAL];
    _status = snapshot.data()[STATUS];
    _createdAt = snapshot.data()[CREATED_AT];
    cart = snapshot.data()[CART];
  }
}
