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
  final formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();

  Status get status => _status;
  Firebase.User get user => _user;

  AuthProvider.initialize() : _auth = Firebase.FirebaseAuth.instance {
    _auth.authStateChanges().listen(_onStateChanged);
  }

  Future<void> _onStateChanged(Firebase.User firebaseUser) async {
    if (firebaseUser == null) {
      _status = Status.Uninitialized;
    } else {
      _user = firebaseUser;
      _status = Status.Authenticated;
      _userModel = await _userServices.getUserById(firebaseUser.uid);
    }

    notifyListeners();
  }
}
