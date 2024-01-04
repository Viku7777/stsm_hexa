import 'package:cattel_feed/resource/const/textstyle.dart';
import 'package:cattel_feed/view/cart_view/cart_view.dart';
import 'package:cattel_feed/view/notification_screens/empty_notification.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

AppBar customAppbar(title,
        {bool isActionButtonShow = true, bool elevation = false}) =>
    AppBar(
      backgroundColor: Colors.white,
      elevation: elevation ? 2 : 0,
      title: Text(
        title,
        style: GetTextTheme.fs16_regular,
      ),
      actions: isActionButtonShow
          ? [
              IconButton(
                  onPressed: () {
                    Get.to(() => const EmptyNotificationView());
                  },
                  icon: const Icon(Icons.notifications_none_rounded)),
              IconButton(
                  onPressed: () {
                    Get.to(() => const CartView());
                  },
                  icon: const Icon(Icons.shopping_cart_outlined)),
            ]
          : [],
    );
