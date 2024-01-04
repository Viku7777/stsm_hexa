import 'dart:math';

import 'package:cattel_feed/model/order_model/order_model.dart';
import 'package:cattel_feed/repository/order_repository/order_repository.dart';
import 'package:cattel_feed/resource/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../resource/const/colors.dart';
import '../../resource/const/nextscreen.dart';
import '../../resource/const/showdialog.dart';
import '../../resource/const/textstyle.dart';
import '../../view/bottomNav/bottom_Nav.dart';

class OrderController extends GetxController {
  List<OrderModel> _orders = [];
  List<OrderModel> get orders => _orders;

  setOrders(List<OrderModel> orders) {
    _orders = orders;
    update();
  }

  String generateRandomId() {
    List<String> text =
        "1234567890ABCDEFGHIJKLMOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
            .split("");
    String id = "";
    Random random = Random();
    for (var i = 0; i < 10; i++) {
      id += text[random.nextInt(text.length)];
    }

    return id;
  }

  // addOrder(OrderModel order) {
  //   _orders.add(order);
  //   update();
  // }

  updateOrderStatus(String id, OrderStatus status) {
    int i = _orders.indexWhere((element) => element.orderId == id);
    _orders[i].orderStatus = status;
  }

  addOrder(BuildContext context, OrderModel order) async {
    try {
      final orderData = order;
      OrderRepository().addOrder(order)
        ..then((data) {
          order.orderId = data.id;
          _orders.add(orderData);
          
          update();
          showDialog(
            context: context,
            builder: (context) => showSuccessDialog(
                "Thanks for your order",
                "Your payment was complete, and your order placed successfully. We will notify you when the order is dispatched or delivered.",
                [
                  ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size.fromHeight(35.h),
                          backgroundColor: AppColors.greythinColor),
                      onPressed: () {},
                      icon: const Icon(
                        Icons.download,
                        color: Colors.black,
                      ),
                      label: Text("Download Receipt",
                          style: GetTextTheme.fs16_regular)),
                  5.h.heightBox,
                  ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size.fromHeight(35.h),
                          backgroundColor: AppColors.greenColor),
                      onPressed: () {
                        nextscreenRemove(context, BottomNavView.routes);
                      },
                      icon: const Icon(
                        Icons.shopping_bag_outlined,
                        color: Colors.white,
                      ),
                      label: Text("Continue Shopping",
                          style: GetTextTheme.fs16_regular
                              .copyWith(color: Colors.white))),
                ]),
          );
        })
        ..onError((error, stackTrace) =>
            Utils.flushBarErrorMessage(error.toString(), context));
    } catch (e) {
      Utils.flushBarErrorMessage(e.toString(), context);
    }
  }
}
