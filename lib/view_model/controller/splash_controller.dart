import 'dart:convert';

import 'package:cattel_feed/model/user_model.dart';
import 'package:cattel_feed/repository/banner_repository/banner_repository.dart';
import 'package:cattel_feed/repository/firebase_repository/firebase_repository.dart';
import 'package:cattel_feed/resource/sf/offline_storage.dart';
import 'package:cattel_feed/resource/utils/utils.dart';
import 'package:cattel_feed/view/auth/screens/loginwithNumber.dart';
import 'package:cattel_feed/view/screens/bottomNav/bottom_Nav.dart';
import 'package:cattel_feed/view_model/controller/address_controller.dart';
import 'package:cattel_feed/view_model/controller/app_data_controller.dart';
import 'package:cattel_feed/view_model/controller/item_favorite.dart';
import 'package:cattel_feed/view_model/controller/logged_in_user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class SplashController extends GetxController {
  bool isloading = false;
  bool get loading => isloading;
  updateloading() {
    isloading = !isloading;
    update();
  }

  FirebaseRepository apis = FirebaseRepository();

  Future<void> getData(BuildContext context) async {
    var controller = Get.find<AppData>();
    BannerRepository banner = BannerRepository();
    banner.getAllBanners(context);

    var favcontroller = Get.find<FavoriteItemController>();

    updateloading();
    favcontroller.updateFavoriteItemList();
    await apis.getCategories().then((value) async {
      controller.updateCategories(value);
      await apis.getSubCategories().then((sub) async {
        controller.updateSubCategories(sub);
        await apis.getProducts().then((product) async {
          controller.updateProducts(product);

          String? data = await SFStorage.getSFData(SFStorage.savedUser);

          if (data.isEmptyOrNull) {
            Get.offNamedUntil(LoginWithNumber.routes, (route) => false);
          } else {
            var controller = Get.find<LoggedInUserController>();
            var addresscontroller = Get.find<UserAddressController>();
            controller.updateUser(UserModel.fromJson(jsonDecode(data!)));
            addresscontroller.updateAddress(controller.userModel!.addresses);
            Get.offNamedUntil(BottomNavView.routes, (route) => false);
          }
          updateloading();
        }).onError((error, stackTrace) {
          throw Exception(error.toString());
        });
      }).onError((error, stackTrace) {
        throw Exception(error.toString());
      });
    }).onError((error, stackTrace) {
      updateloading();
      Utils.flushBarErrorMessage(error.toString(), context);
    });
  }
}
