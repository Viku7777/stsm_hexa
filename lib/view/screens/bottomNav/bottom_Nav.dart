import 'package:cattel_feed/Helper/colors.dart';
import 'package:cattel_feed/helper/icon.dart';
import 'package:cattel_feed/view/screens/account_setting/home/account_home.dart';
import 'package:cattel_feed/view/screens/cart_view/cart_view.dart';
import 'package:cattel_feed/view/screens/categories/ui/categories_view.dart';
import 'package:cattel_feed/view/screens/homepage/home_view/home_screen_view.dart';
import 'package:cattel_feed/view/screens/notification_screens/empty_notification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class BottomNavView extends StatefulWidget {
  static String routes = "/bottomnav";

  const BottomNavView({super.key});

  @override
  State<BottomNavView> createState() => _BottomNavViewState();
}

class _BottomNavViewState extends State<BottomNavView> {
  @override
  // ignore: override_on_non_overriding_member
  int currentindex = 0;
  List screens = [
    const HomeScreenView(),
    const CategoriesView(),
    const CartView(),
    const EmptyNotificationView(),
    const AccountHomeView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: currentindex,
        onTap: (i) => setState(() => currentindex = i),
        items: [
          /// Home
          SalomonBottomBarItem(
            icon: Image.asset(
              BottomNavIcons.home,
              height: 18.h,
              width: 18.w,
            ),
            title: const Text("Home"),
            selectedColor: AppColors.primaryColor,
          ),

          /// Likes
          SalomonBottomBarItem(
            icon: Image.asset(
              BottomNavIcons.category,
              height: 18.h,
              width: 18.w,
            ),
            title: const Text("Category"),
            selectedColor: AppColors.primaryColor,
          ),

          /// Search
          SalomonBottomBarItem(
            icon: const Icon(
              Icons.shopping_cart_outlined,
              color: Colors.black,
            ),
            title: const Text("Cart"),
            selectedColor: AppColors.primaryColor,
          ),

          /// Profile
          SalomonBottomBarItem(
            icon: Image.asset(
              BottomNavIcons.notification,
              height: 18.h,
              width: 18.w,
            ),
            title: const Text("Notifications"),
            selectedColor: AppColors.primaryColor,
          ),
          SalomonBottomBarItem(
            icon: Image.asset(
              BottomNavIcons.options,
              height: 18.h,
              width: 18.w,
            ),
            title: const Text("Options"),
            selectedColor: AppColors.primaryColor,
          ),
        ],
      ),
      body: screens[currentindex],
    );
  }
}
