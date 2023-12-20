import 'package:cattel_feed/model/cart_model.dart';
import 'package:cattel_feed/model/cart_model/cart_product_model.dart';
import 'package:cattel_feed/repository/cart_repository/cart_repository.dart';
import 'package:cattel_feed/view_model/controller/logged_in_user_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  var ref = FirebaseFirestore.instance.collection("cart");
  bool isLoading = false;
  updateLoading() {
    isLoading = !isLoading;
    update();
  }

  CartRepository apis = CartRepository();
  Future<void> addItem(BuildContext context, CartProductModel item) async {
    var currentuser = Get.find<LoggedInUserController>();
    var customer = Customer(
      email: currentuser.user.email,
      image: currentuser.user.image,
      name: currentuser.user.name,
      phone: currentuser.user.phone,
    );
    CartProductModel cartItem = item;
    cartItem.customer = customer;
    String uid = currentuser.userModel!.uid.toString();
    FirebaseFirestore.instance.collection("cart").doc(uid).set(item.toJson());

    // apis.addItemInCart(ref.doc(uid), elements, key).then((value) => null).onError((error, stackTrace) => Utils.flushBarErrorMessage(error.toString(), context));
  }
}
