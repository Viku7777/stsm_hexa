import 'dart:convert';
import 'package:cattel_feed/data/network/network_api_services.dart';
import 'package:cattel_feed/model/service_area_model/services_model.dart';
import 'package:cattel_feed/model/user_model/user_model.dart';
import 'package:cattel_feed/repository/banner_repository/banner_repository.dart';
import 'package:cattel_feed/repository/firebase_repository/firebase_repository.dart';
import 'package:cattel_feed/resource/sf/offline_storage.dart';
import 'package:cattel_feed/resource/utils/utils.dart';
import 'package:cattel_feed/view/auth/screens/loginwithNumber.dart';
import 'package:cattel_feed/view/bottomNav/bottom_Nav.dart';
import 'package:cattel_feed/view_model/controller/address_controller.dart';
import 'package:cattel_feed/view_model/controller/app_data_controller.dart';
import 'package:cattel_feed/view_model/controller/item_favorite.dart';
import 'package:cattel_feed/view_model/controller/logged_in_user_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
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

  Future<bool> checkInternet() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      return true;
    } else {
      return false;
    }
  }

  FirebaseRepository apis = FirebaseRepository();

  Future<void> getData(BuildContext context) async {
    var controller = Get.find<AppData>();
    var networkApis = NetworkApiServices();

    BannerRepository banner = BannerRepository();
    await banner.getAllBanners(context);
    updateloading();

    var favcontroller = Get.find<FavoriteItemController>();
    var data = await networkApis.getCollectionData(
        FirebaseFirestore.instance.collection("ServiceAreas"));
    controller.updateServicesArea(data.docs
        .map((e) => ServiceAreaModel.fromJson(e.data() as Map<String, dynamic>))
        .toList());

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
            UserModel user = UserModel.fromJson(jsonDecode(data!));
            var controller = Get.find<LoggedInUserController>();
            var addresscontroller = Get.find<UserAddressController>();

            FirebaseRepository.getUserProfile(user.uid).then((v) async {
              await SFStorage.setSFData(
                  SFStorage.savedUser, jsonEncode(v!.toJson()));
              controller.updateUser(v);
              addresscontroller.updateAddress(v.addresses);
              updateloading();

              Get.offAll(const BottomNavView());
            }).onError((error, stackTrace) {
              updateloading();
              Utils.flushBarErrorMessage(error.toString(), context);
            });
          }
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
