// ignore_for_file: file_names

import 'package:cattel_feed/language/language.dart';
import 'package:cattel_feed/model/product_model/product_model.dart';
import 'package:cattel_feed/repository/firebase_repository/firebase_repository.dart';
import 'package:cattel_feed/resource/const/colors.dart';
import 'package:cattel_feed/resource/const/icon.dart';
import 'package:cattel_feed/services/notification_services.dart';
import 'package:cattel_feed/view/account_setting/home/account_home.dart';
import 'package:cattel_feed/view/cart_view/cart_view.dart';
import 'package:cattel_feed/view/categories/ui/categories_view.dart';
import 'package:cattel_feed/view/homepage/home_view/dashboard.dart';
import 'package:cattel_feed/view/notification_screens/empty_notification.dart';
import 'package:cattel_feed/view_model/controller/app_data_controller.dart';
import 'package:cattel_feed/view_model/controller/logged_in_user_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class BottomNavView extends StatefulWidget {
  static String routes = "/bottomnav";

  const BottomNavView({super.key});

  @override
  State<BottomNavView> createState() => _BottomNavViewState();
}

class _BottomNavViewState extends State<BottomNavView> {
  @override
  void initState() {
    getData();
    super.initState();
  }

  // ignore: override_on_non_overriding_member

  List screens = [
    const DashboardScreenView(),
    const CategoriesView(),
    const CartView(),
    const EmptyNotificationView(),
    const AccountHomeView(),
  ];
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppData>(
      builder: (controller) => Scaffold(
          bottomNavigationBar: SalomonBottomBar(
            currentIndex: controller.currentScreenIndex,
            onTap: (i) => controller.updateScreenIndex(i),
            items: [
              /// Home
              SalomonBottomBarItem(
                icon: Image.asset(
                  BottomNavIcons.home,
                  height: 18.h,
                  width: 18.w,
                ),
                title: Text(LanguagesKey.home.tr),
                selectedColor: AppColors.primaryColor,
              ),

              /// Likes
              SalomonBottomBarItem(
                icon: Image.asset(
                  BottomNavIcons.category,
                  height: 18.h,
                  width: 18.w,
                ),
                title: Text(LanguagesKey.category.tr),
                selectedColor: AppColors.primaryColor,
              ),

              /// Search
              SalomonBottomBarItem(
                icon: const Icon(
                  Icons.shopping_cart_outlined,
                  color: Colors.black,
                ),
                title: Text(LanguagesKey.cart.tr),
                selectedColor: AppColors.primaryColor,
              ),

              /// Profile
              SalomonBottomBarItem(
                icon: Image.asset(
                  BottomNavIcons.notification,
                  height: 18.h,
                  width: 18.w,
                ),
                title: Text(LanguagesKey.alerts.tr),
                selectedColor: AppColors.primaryColor,
              ),
              SalomonBottomBarItem(
                icon: Image.asset(
                  BottomNavIcons.options,
                  height: 18.h,
                  width: 18.w,
                ),
                title: Text(LanguagesKey.options.tr),
                selectedColor: AppColors.primaryColor,
              ),
            ],
          ),
          body: screens[controller.currentScreenIndex]),
    );
  }

  getData() async {
    var controller = Get.find<AppData>();
    FirebaseRepository.cartProducts();
    List<ProductModel> products = controller.products;
    products.shuffle();

    controller.productsforyou = products;
    var loggedInUser = Get.find<LoggedInUserController>();
    if (!loggedInUser.isGuestUser) {
      NotificationServices.requestNotification(context);
    }
  }
}
