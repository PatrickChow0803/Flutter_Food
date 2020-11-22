import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_food/src/models/order.dart';

class OrderServices {
  String collection = 'orders';
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // These keys are the fields that will be created in FireStore
  void createOrder(
      {String userId, String id, String description, String status, List cart, int totalPrice}) {
    _firestore.collection(collection).doc(id).set({
      "userId": userId,
      "id": id,
      "cart": cart,
      "total": totalPrice,
      "createdAt": DateTime.now().microsecondsSinceEpoch,
      "description": description,
      "status": status,
    });
  }

  Future<List<OrderModel>> getUserOrders({String userId}) async =>
      // Look in the collection named "orders" and return the orders where each document's userId field is
      // equal to the userId String that's passed in
      _firestore.collection(collection).where("userId", isEqualTo: userId).get().then((result) {
        List<OrderModel> orders = [];
        for (DocumentSnapshot order in result.docs) {
          orders.add(OrderModel.fromSnapshot(order));
        }
        return orders;
      });
}
