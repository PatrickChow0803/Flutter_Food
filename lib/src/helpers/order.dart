import 'package:cloud_firestore/cloud_firestore.dart';

class OrderService {
  String collection = 'orders';
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // These keys are the fields that will be created in FireStore
  void createOrder({String userId, String id, List cart, int totalPrice}) {
    _firestore.collection(collection).doc(id).set({
      "userId": userId,
      "id": id,
      "cart": cart,
      "total": totalPrice,
      "createdAt": DateTime.now().microsecondsSinceEpoch
    });
  }
}
