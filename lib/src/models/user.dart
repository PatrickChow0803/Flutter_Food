import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  // THESE STATIC CONST VARIABLES ARE USED TO REPRESENT THE NAME OF THE FIELD IN FIRESTORE
  // NOT THE DATA
  // These variable values should match the variable values inside of auth's sign up method
  static const NAME = 'name';
  static const EMAIL = 'email';
  static const ID = 'id';
  static const STRIPE_ID = "stripeId";

  String _name;
  String _email;
  String _id;
  String _stripeId;

  String get name => _name;
  String get email => _email;
  String get id => _id;
  String get stripeId => _stripeId;

  // .fromSnapshot can be anything I want. I'm naming it this because that's the data from firebase
  // Used to convert a a SnapShot into the corresponding model
  UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    _name = snapshot.data()[NAME];
    _email = snapshot.data()[EMAIL];
    _id = snapshot.data()[ID];
    _stripeId = snapshot.data()[STRIPE_ID];
  }
}
