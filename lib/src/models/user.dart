import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_food/src/models/cart_item.dart';

class UserModel {
  // THESE STATIC CONST VARIABLES ARE USED TO REPRESENT THE NAME OF THE FIELD IN FIRESTORE
  // NOT THE DATA
  // These variable values should match the variable values inside of auth's sign up method
  static const NAME = 'name';
  static const EMAIL = 'email';
  static const ID = 'id';
  static const STRIPE_ID = "stripeId";
  static const CART = "cart";

  String _name;
  String _email;
  String _id;
  String _stripeId;
  List<CartItemModel> _cart;

  String get name => _name;
  String get email => _email;
  String get id => _id;
  String get stripeId => _stripeId;
  List<CartItemModel> get card => _cart;

  // .fromSnapshot can be anything I want. I'm naming it this because that's the data from firebase
  // Used to convert a a SnapShot into the corresponding model
  UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    _name = snapshot.data()[NAME];
    _email = snapshot.data()[EMAIL];
    _id = snapshot.data()[ID];
    _stripeId = snapshot.data()[STRIPE_ID];
//    _cart = _convertCartItems(snapshot.data()[CART]) ?? [];
  }

  // Gets cart items as maps, and converting them to CartItemModels to be used in the application
  List<CartItemModel> _convertCartItems(List cart) {
    List<CartItemModel> convertedCart = [];
    for (Map cartItem in cart) {
      convertedCart.add(CartItemModel.fromMap(cartItem));
    }
    return convertedCart;
  }
}
