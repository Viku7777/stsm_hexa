// ignore_for_file: use_build_context_synchronously

import 'package:cattel_feed/data/network/network_api_services.dart';
import 'package:cattel_feed/resource/utils/utils.dart';
import 'package:cattel_feed/view_model/controller/cart_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../view_model/controller/logged_in_user_controller.dart';

class CartRepository {
  NetworkApiServices apis = NetworkApiServices();

  Future<DocumentSnapshot> getItemInCart(DocumentReference reference) async {
    try {
      return await apis.getData(reference);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<bool> deleteCart(BuildContext context) async {
    try {
      /// Get the Current login User Data
      var currentuser = Get.find<LoggedInUserController>();
      var cartController = Get.find<CartController>();

      /// Get the id of the user
      String uid = currentuser.userModel!.uid.toString();
      FirebaseFirestore.instance.collection('cart').doc(uid).delete()
        ..then((value) {
          cartController.setCartItems([]);
          return true;
        })
        ..onError((error, stackTrace) {
          Utils.flushBarErrorMessage(error.toString(), context);
        });
    } catch (e) {
      Utils.flushBarErrorMessage(e.toString(), context);
    }
    return false;
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
