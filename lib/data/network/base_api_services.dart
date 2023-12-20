import 'package:cloud_firestore/cloud_firestore.dart';

abstract class BaseApiServices {
  Future<dynamic> authbase(String type, dynamic data, {bool islogin});
  Future<dynamic> getfirestore(var reference);
  Future<dynamic> postFirestore(DocumentReference reference, dynamic data);
}
