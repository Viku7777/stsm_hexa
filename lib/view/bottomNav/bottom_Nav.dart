// ignore_for_file: file_names

import 'package:cattel_feed/resource/const/colors.dart';
import 'package:cattel_feed/resource/const/icon.dart';
import 'package:cattel_feed/view/account_setting/home/account_home.dart';
import 'package:cattel_feed/view/cart_view/cart_view.dart';
import 'package:cattel_feed/view/categories/ui/categories_view.dart';
import 'package:cattel_feed/view/homepage/home_view/dashboard.dart';
import 'package:cattel_feed/view/notification_screens/empty_notification.dart';
import 'package:cattel_feed/view_model/controller/app_data_controller.dart';
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
    // getData();
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
                title: const Text("Alerts"),
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
          body: screens[controller.currentScreenIndex]),
    );
  }

  // getData() async {
  //   var loadingController = Get.put(LoadingController());
  //   loadingController.updateLoadingState();
  //   var controller = Get.put(AddressController());
  //   var favcontroller = Get.put(FavoritesItemController());
  //   var categoirescontroller = Get.put(CategoriesController());

  //   String? data0 = await getSFData("userAllAddresses");
  //   String? fav = await getSFData("logginUserFavItem");
  //   if (data0.isNotEmptyAndNotNull) {
  //     List data1 = jsonDecode(data0!);
  //     List<AddressModel> alladdress =
  //         data1.map((e) => AddressModel.fromJson(e)).toList();
  //     controller.updateUserAllAddresses(alladdress);
  //   }
  //   if (fav.isNotEmptyAndNotNull) {
  //     List data = jsonDecode(fav!);
  //     favcontroller.updateList(data);
  //   }

  //   var firebase = FirebaseFirestore.instance;
  //   var categories = await firebase.collection("categories").get();
  //   var subcategories =
  //       await FirebaseFirestore.instance.collection("sub_categories").get();

  //   // var products =
  //   //     await FirebaseFirestore.instance.collection("products").get();
  //   FirebaseData.categoires = categories.docs
  //       .map((e) => OldCategoiresModel.FromJson(e.data(), e.id))
  //       .toList();
  //   categoirescontroller.updateCategories(FirebaseData.categoires!);
  //   FirebaseData.subcategoires = subcategories.docs
  //       .map((e) => OldSubCategoriesModel.FromJson(e.data(), e.id))
  //       .toList();

  //   // FirebaseData.products = products.docs
  //   //     .map((e) => ProductItemModel.fromJson(e.data(), e.id))
  //   //     .toList();

  //   loadingController.updateLoadingState();
  // }
}
