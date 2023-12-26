import 'package:cattel_feed/data/network/network_api_services.dart';
import 'package:cattel_feed/model/order_model/order_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class OrderRepository {
  NetworkApiServices apis = NetworkApiServices();

  final _collectionRef = FirebaseFirestore.instance.collection("order");

  Future<DocumentReference> addOrder(OrderModel order) async {
    try {
      return await _collectionRef.add(order.toJson());
    } catch (e) {
      throw Exception(e);
    }
  }
}
