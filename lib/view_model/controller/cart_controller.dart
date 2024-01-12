import 'package:cattel_feed/model/product_model/product_model.dart';
import 'package:cattel_feed/resource/const/colors.dart';
import 'package:cattel_feed/resource/const/icon.dart';
import 'package:cattel_feed/resource/const/textstyle.dart';
import 'package:cattel_feed/resource/utils/utils.dart';
import 'package:cattel_feed/view_model/controller/cart_model.dart';
import 'package:cattel_feed/view_model/controller/item_detail_view_controller.dart';
import 'package:cattel_feed/view_model/controller/logged_in_user_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class NewCartController extends GetxController {
  List<CartItems> cartItems = [];
  bool loading = false;
  updateLoadingStatus() {
    loading = !loading;
    update();
  }

  addCartProductOnFirebase() async {
    var controller = Get.find<LoggedInUserController>();
    updateLoadingStatus();
    await FirebaseFirestore.instance
        .collection("cart")
        .doc(controller.userModel!.uid)
        .set({
      "uid": controller.userModel!.uid,
      "items": cartItems.map((e) => e.toJson()).toList()
    }).then((value) => updateLoadingStatus());
  }

  cleanCart() {
    cartItems.clear();
    update();
    addCartProductOnFirebase();
  }

  updateCartItems(List<CartItems> list) {
    cartItems = list;
    update();
  }

  addCartItem(CartItems cartItem) {
    bool isFound = cartItems.any((element) =>
        element.productId == cartItem.productId &&
        element.varientName == cartItem.varientName);
    if (isFound) {
      int index = cartItems
          .indexWhere((element) => element.productId == cartItem.productId);
      cartItems[index].quantity = cartItems[index].quantity! + 1;
    } else {
      cartItems.add(cartItem);
    }
    addCartProductOnFirebase();
    update();
  }

  removeProduct(int index) {
    if (cartItems[index].quantity != 1) {
      cartItems[index].quantity = cartItems[index].quantity! - 1;

      addCartProductOnFirebase();
      update();
    }
  }

  deleteProduct(int index) {
    cartItems.removeAt(index);
    addCartProductOnFirebase();
    update();
  }

  addQuantity(int index) {
    cartItems[index].quantity = cartItems[index].quantity! + 1;
    addCartProductOnFirebase();
    update();
  }
}

void addToCartService(BuildContext context, ProductModel product) {
  var controller = Get.find<NewCartController>();
  var provider = Get.find<ItemDetailsViewController>();
  String discount = "";
  String orignalprice = provider.currentVarients.originalPrice.toString();
  String finalPrice = "";
  if (provider.currentVarients.discount == "0") {
    discount = "0";

    finalPrice = provider.currentVarients.originalPrice.toString();
  } else {
    finalPrice = Utils.findPrice(
            orignalprice,
            provider.currentVarients.discount.toString(),
            provider.currentVarients.discountType.toString())
        .toString();
  }
  discount = (Utils.convertStringIntoInt(orignalprice) -
          Utils.convertStringIntoInt(finalPrice))
      .toString();

  CartItems cartItem = CartItems(
      quantity: 1,
      image: product.productImages!.first,
      productId: product.id,
      title: product.name ?? "not_found",
      varientDiscount: discount,
      varientName: provider.currentVarients.name,
      finalPrice: finalPrice,
      varientPrice: orignalprice);
  controller.addCartItem(cartItem);

  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: AppColors.greenColor,
    behavior: SnackBarBehavior.floating,
    content: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          IconsClass.cartIcon,
          height: 30.h,
          width: 30.h,
        ),
        20.w.widthBox,
        Text("Item Successfully Added to Cart",
            overflow: TextOverflow.fade,
            style: GetTextTheme.fs16_medium.copyWith(color: Colors.white))
      ],
    ),
  ));
}
