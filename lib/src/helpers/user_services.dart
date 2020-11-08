import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_food/src/models/user.dart';

// THIS FILE IS USED TO UPDATE DATA WITHIN FIRESTORE

class UserServices {
  String collection = 'users';
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void createUser(Map<String, dynamic> values) {
    _firestore.collection(collection).doc(values['id']).set(values);
  }

  void updateUserData(Map<String, dynamic> values) {
    _firestore.collection(collection).doc(values['id']).update(values);
  }

  Future<UserModel> getUserById(String id) =>
      _firestore.collection(collection).doc(id).get().then((doc) => UserModel.fromSnapshot(doc));
}
