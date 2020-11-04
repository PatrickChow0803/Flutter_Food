import 'package:firebase_auth/firebase_auth.dart' as Firebase;
import 'package:flutter/material.dart';
import 'package:flutter_food/src/helpers/user_services.dart';
import 'package:flutter_food/src/models/user.dart';

enum Status {
  Uninitialized,
  Unauthenticated,
  Authenticating,
  Authenticated,
}

class AuthProvider with ChangeNotifier {
  Firebase.FirebaseAuth _auth;
  Firebase.User _user;
  Status _status = Status.Uninitialized;
  UserServices _userServices = UserServices();
  UserModel _userModel;

  Status get status => _status;
  Firebase.User get user => _user;
}
