import 'package:cattel_feed/resource/const/colors.dart';
import 'package:cattel_feed/resource/const/textstyle.dart';
import 'package:cattel_feed/view/cart_view/cart_view.dart';
import 'package:cattel_feed/view/notification_screens/empty_notification.dart';
import 'package:cattel_feed/view_model/controller/cart_controller.dart';
import 'package:cattel_feed/view_model/controller/logged_in_user_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:badges/badges.dart' as badges;

var loggedInUser = Get.put(LoggedInUserController());

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
              Padding(
                padding: const EdgeInsets.all(0).copyWith(right: 25.w),
                child: badges.Badge(
                  badgeStyle:
                      badges.BadgeStyle(badgeColor: AppColors.primaryColor),
                  onTap: () {
                    Get.to(const CartView());
                  },
                  showBadge: (loggedInUser.isGuestUser) ? false : true,
                  badgeContent: GetBuilder<NewCartController>(
                    builder: (controller) =>
                        Text(controller.cartItems.length.toString()),
                  ),
                  position: badges.BadgePosition.bottomEnd(
                    bottom: 5,
                  ),
                  child: Icon(
                    Icons.shopping_cart_outlined,
                    color: AppColors.blackColor,
                    size: 20.sp,
                  ),
                ),
              ),
            ]
          : [],
    );
