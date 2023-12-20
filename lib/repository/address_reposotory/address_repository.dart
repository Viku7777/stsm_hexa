import 'package:cattel_feed/data/network/network_api_services.dart';
import 'package:cattel_feed/model/address_model/addressModel.dart';
import 'package:cattel_feed/view_model/controller/logged_in_user_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class AddressRepositroy {
  NetworkApiServices apis = NetworkApiServices();

  Future<void> addNewAddress(AddressModel newaddress) async {
    var controller = Get.find<LoggedInUserController>();
    try {
      await FirebaseFirestore.instance
          .collection("customers")
          .doc(controller.user.uid)
          .update({
        "addresses": FieldValue.arrayUnion([newaddress.toJson()])
      });
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> removeAddress(AddressModel removeaddress) async {
    var controller = Get.find<LoggedInUserController>();
    try {
      await FirebaseFirestore.instance
          .collection("customers")
          .doc(controller.user.uid)
          .update({
        "addresses": FieldValue.arrayRemove([removeaddress.toJson()])
      });
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> editAddress(AddressModel removeaddress) async {
    var controller = Get.find<LoggedInUserController>();
    try {
      await FirebaseFirestore.instance
          .collection("customers")
          .doc(controller.user.uid)
          .update({
        // "addresses": FieldValue.
      });
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
