import 'package:firebase_auth/firebase_auth.dart' as Firebase;
import 'package:flutter/material.dart';
import 'package:flutter_food/src/helpers/user_services.dart';
import 'package:flutter_food/src/models/product.dart';
import 'package:flutter_food/src/models/user.dart';
import 'package:uuid/uuid.dart';

enum Status {
  Uninitialized,
  Unauthenticated,
  Authenticating,
  Authenticated,
}

class UserProvider with ChangeNotifier {
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
  UserModel get userModel => _userModel;
  Firebase.User get user => _user;

  // When we create this provider class, call this named constructor called initialize
  // So when authenication changes, the auth state is going to change. We want to listen to that
  // When this change occurs, I want to do something on my app to reflect the user state change in Firebase
  UserProvider.initialize() : _auth = Firebase.FirebaseAuth.instance {
    _auth.authStateChanges().listen(_onStateChanged);
  }

  Future<bool> signIn() async {
    try {
      _status = Status.Authenticating;
      notifyListeners();
      await _auth.signInWithEmailAndPassword(
          email: email.text.trim(), password: password.text.trim());
      return true;
    } catch (e) {
      return _onError(e.toString());
    }
  }

  Future<bool> signUp() async {
    try {
      _status = Status.Authenticating;
      notifyListeners();
      await _auth
          .createUserWithEmailAndPassword(email: email.text.trim(), password: password.text.trim())
          // UserCredentials is given back from .createUserWithEmailAndPassword
          .then((userCredentials) {
        Map<String, dynamic> values = {
          'name': name.text,
          'email': email.text,
          'id': userCredentials.user.uid,
          'likedFood': [],
          'likedRestaurants': [],
        };
        // Adds the user to fire store
        _userServices.createUser(values);
      });
      return true;
    } catch (e) {
      return _onError(e.toString());
    }
  }

  void signOut() {
    _auth.signOut();
    _status = Status.Unauthenticated;
    notifyListeners();
    cleanControllers();
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

  // Make this a bool to check to see if the method runs properly
  Future<bool> addToCart({ProductModel product, int quantity})async {
    try{
      // Create a randomly generated Id
      var uuid = Uuid();
      String cartItemId = uuid.v4();
      // Key values MUST match the same writing as in the CartItemModel
      Map values = {
        "id": cartItemId,
        "name": product.name,
        "image": product.image,
        "productId": product.id,
        "price": product.price,
        "quantity": quantity,
      };
      return true;
    }
    catch(e){
      print("addToCart Error: " + e.toString());
      return false;
    }
  }

  // General methods

  bool _onError(String error) {
    _status = Status.Unauthenticated;
    notifyListeners();
    print('error:' + error.toString());
    return false;
  }

  void cleanControllers() {
    email.clear();
    password.clear();
    name.clear();
  }
}
