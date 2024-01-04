import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:cattel_feed/model/product_model/product_model.dart';
import 'package:flutter/material.dart';

class Utils {
  static flushBarErrorMessage(String message, BuildContext context) async {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          message: message,
          padding: const EdgeInsets.all(15),
          duration: const Duration(seconds: 3),
          forwardAnimationCurve: Curves.decelerate,
          reverseAnimationCurve: Curves.easeInOut,
          backgroundColor: Colors.red,
          positionOffset: 20,
          flushbarPosition: FlushbarPosition.TOP,
          icon: const Icon(
            Icons.error,
            size: 28,
            color: Colors.white,
          ),
        )..show(context));
  }

  static flushBarSuccess(String message, BuildContext context) async {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          message: message,
          padding: const EdgeInsets.all(15),
          duration: const Duration(seconds: 3),
          forwardAnimationCurve: Curves.decelerate,
          reverseAnimationCurve: Curves.easeInOut,
          backgroundColor: Colors.green,
          positionOffset: 20,
          flushbarPosition: FlushbarPosition.TOP,
          icon: const Icon(
            Icons.check_circle,
            size: 28,
            color: Colors.white,
          ),
        )..show(context));
  }

  static requestFocus(FocusNode currentFocus, nextfocus, BuildContext context) {
    // currentFocus.unfocus();
    Focus.of(context).requestFocus(nextfocus);
  }

  static int convertStringIntoInt(String number) {
    return int.parse(number);
  }

  static int currentPriceUsingAmount(String originalPrice, String discount) {
    return convertStringIntoInt(originalPrice) - convertStringIntoInt(discount);
  }

  static findPrice(String originalPrice, discount, String discountType) {
    if (discountType.contains("Amount")) {
      return convertStringIntoInt(originalPrice) -
          convertStringIntoInt(discount);
    } else {
      if (discount == "0") {
        return originalPrice;
      } else {
        return (convertStringIntoInt(originalPrice) -
                (convertStringIntoInt(originalPrice) /
                    convertStringIntoInt(discount)))
            .toStringAsFixed(0);
      }
    }
  }

  static List<ProductModel> sortPrice(List<ProductModel> products) {
    List<ProductModel> sortdata = products;
    sortdata.sort((a, b) =>
        Utils.convertStringIntoInt(a.varients!.first.originalPrice.toString())
            .compareTo(Utils.convertStringIntoInt(
                b.varients!.first.originalPrice.toString())));
    return sortdata;
  }

  static imageError() {
    return const Icon(Icons.error);
  }
}
