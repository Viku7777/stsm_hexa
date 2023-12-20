import 'package:cloud_firestore/cloud_firestore.dart';

class CollectionRef {
  static var fstore = FirebaseFirestore.instance;
  static CollectionReference customersReference =
      fstore.collection("customers");
  static CollectionReference categoiresReference =
      fstore.collection("categories");
  static CollectionReference subcategoiresReference =
      fstore.collection("sub_categories");
  static CollectionReference productReference = fstore.collection("products");
}
