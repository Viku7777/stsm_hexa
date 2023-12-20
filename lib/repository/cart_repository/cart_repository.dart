import 'package:cattel_feed/data/network/network_api_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CartRepository {
  NetworkApiServices apis = NetworkApiServices();

  Future<DocumentReference> getItemInCart(DocumentReference reference) async {
    try {
      return await apis.getData(reference);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<DocumentReference> addItemInCart(
      DocumentReference reference, List<dynamic> elements, String key) async {
    try {
      return await apis.updatefieldData(reference, key, elements);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<DocumentReference> removeItemInCart(
      DocumentReference reference, List<dynamic> elements, String key) async {
    try {
      return await apis.removefieldData(reference, key, elements);
    } catch (e) {
      throw Exception(e);
    }
  }
}
