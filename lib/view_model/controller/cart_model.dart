import 'dart:convert';

import 'package:cattel_feed/model/product_model/product_model.dart';

// // ignore_for_file: use_build_context_synchronously

// import 'package:cattel_feed/model/cart_model/cart_product_model.dart';
// import 'package:cattel_feed/repository/cart_repository/cart_repository.dart';
// import 'package:cattel_feed/resource/utils/utils.dart';
// import 'package:cattel_feed/view_model/controller/logged_in_user_controller.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class CartController extends GetxController {
//   var ref = FirebaseFirestore.instance.collection("cart");
//   bool isLoading = false;
//   updateLoading() {
//     isLoading = !isLoading;
//     update();
//   }

//   List<Items> _cartItems = [];
//   List<Items> get cartItems => _cartItems;

//   setCartItems(List<Items> items) {
//     _cartItems = items;
//     update();
//   }

//   deleteCartItem(int i) {
//     _cartItems.removeAt(i);
//     update();
//   }

//   addCartItem(Items item) {
//     _cartItems.add(item);
//     update();
//   }

//   increaseItemQuantity(int i) {
//     _cartItems[i].qnty = _cartItems[i].qnty! + 1;
//     update();
//   }

//   decreaseItemQuantity(int i) {
//     _cartItems[i].qnty = _cartItems[i].qnty! - 1;
//     update();
//   }

//   CartRepository apis = CartRepository();
//   Future<void> addItem(BuildContext context, CartProductModel item) async {
//     /// Get the Current login User Data
//     var currentuser = Get.find<LoggedInUserController>();

//     /// Get the id of the user
//     String uid = currentuser.userModel!.uid.toString();

//     // );
//     CartProductModel cartItem = item;
//     // cartItem.customer = customer;

//     /// set the current user id to the [CartProductModel]
//     cartItem.uid = uid;

//     /// Get the cart document data if there is any cart present with the current user id
//     /// if the docs is empty then it creates a new cart document otherwise update the items in the present cart.
//     final cart = await ref.where("uid", isEqualTo: uid).get();
//     if (cart.docs.isEmpty) {
//       ref.doc(uid).set(item.toJson())
//         ..then((value) => {
//               addCartItem(cartItem.items!.first),
//               Utils.flushBarSuccess("Item Added To Cart.", context)
//             })
//         ..onError((error, stackTrace) =>
//             Utils.flushBarErrorMessage(error.toString(), context));
//     } else {
//       CartRepository().addItemInCart(cart.docs.first.reference,
//           cartItem.items!.map((e) => e.toJson()).toList(), "items")
//         ..then((value) => {
//               addCartItem(cartItem.items!.first),
//               Utils.flushBarSuccess("Item Added To Cart.", context)
//             })
//         ..onError((error, stackTrace) =>
//             Utils.flushBarErrorMessage(error.toString(), context));
//     }
//     // apis.addItemInCart(ref.doc(uid), elements, key).then((value) => null).onError((error, stackTrace) => Utils.flushBarErrorMessage(error.toString(), context));
//   }

//   Future<void> getCartItems(BuildContext context) async {
//     try {
//       /// Get the Current login User Data
//       var currentuser = Get.find<LoggedInUserController>();

//       /// Get the id of the user
//       String uid = currentuser.userModel!.uid.toString();

//       final cartReference = ref.doc(uid);
//       final response = await apis.getItemInCart(cartReference);
//       final cart = response.data() == null
//           ? null
//           : CartProductModel.fromJson(response.data() as Map<String, dynamic>);
//       setCartItems(cart == null ? [] : cart.items ?? []);
//     } catch (error) {
//       Utils.flushBarErrorMessage(error.toString(), context);
//     }
//   }

//   Future<void> removeCartItem(BuildContext context, Items item, int i) async {
//     try {
//       /// Get the Current login User Data
//       var currentuser = Get.find<LoggedInUserController>();

//       /// Get the id of the user
//       String uid = currentuser.userModel!.uid.toString();
//       apis.removeItemInCart(ref.doc(uid), [item.toJson()], "items")
//         ..then((value) => {
//               deleteCartItem(i),
//               Utils.flushBarSuccess("Item Removed Successfully", context)
//             })
//         ..onError((error, stackTrace) =>
//             Utils.flushBarErrorMessage(error.toString(), context));
//     } catch (e) {
//       Utils.flushBarErrorMessage(e.toString(), context);
//     }
//   }

// }

class CartModel {
  String uid;
  List<CartItems> items;

  CartModel({required this.uid, required this.items});

  CartModel.fromJson(Map<String, dynamic> json)
      : uid = json['uid'],
        items =
            (json["items"] as List).map((e) => CartItems.fromJson(e)).toList();

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uid'] = uid;
    data["items"] = items.map((e) => e.toJson()).toList();
    return data;
  }
}

class CartItems {
  String? image;
  int? quantity;
  String? color;
  String? size;
  String? finalPrice;
  String? varientName;
  String? productId;
  String? varientDiscount;
  String? varientPrice;
  String? createAt;
  String? title;

  CartItems({
    this.image,
    required this.quantity,
    required this.title,
    this.color,
    this.size,
    this.finalPrice,
    this.varientName,
    this.productId,
    this.varientDiscount,
    this.varientPrice,
    this.createAt,
  });

  CartItems.fromJson(Map<String, dynamic> json) {
    image = json['image'] ?? "";
    quantity = json['quantity'] ?? 0;
    color = json['color'] ?? "";
    size = json['size'] ?? "";
    finalPrice = json['final_price'] ?? "";
    varientName = json['varient_name'] ?? "";
    productId = json['product_id'] ?? "";
    varientDiscount = json['varient_discount'] ?? "";
    varientPrice = json['varient_price'] ?? "";
    createAt = json['createAt'].toString();
    title = json["title"] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image'] = image ?? "";
    data['quantity'] = quantity ?? 1;
    data['color'] = color ?? "";
    data['size'] = size ?? "";
    data['final_price'] = finalPrice ?? "";
    data['varient_name'] = varientName ?? "not_found";
    data['product_id'] = productId ?? "";
    data['varient_discount'] = varientDiscount ?? "";
    data['varient_price'] = varientPrice ?? "";
    data['createAt'] = DateTime.now().toIso8601String();
    data["title"] = title ?? "";
    return data;
  }
}
  