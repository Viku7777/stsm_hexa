// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:cattel_feed/Helper/nextscreen.dart';
import 'package:cattel_feed/controller/addressController/addressController.dart';
import 'package:cattel_feed/controller/categories_controller.dart/categories_controller.dart';
import 'package:cattel_feed/controller/fav_item_controller/fav_item_controller.dart';
import 'package:cattel_feed/global/global.dart';
import 'package:cattel_feed/model/addressModel.dart';
import 'package:cattel_feed/model/categorymodel.dart';
import 'package:cattel_feed/model/productsModel.dart';
import 'package:cattel_feed/model/sub_category.dart';
import 'package:cattel_feed/model/user_model.dart';
import 'package:cattel_feed/view/screens/auth/screens/loginwithNumber.dart';
import 'package:cattel_feed/view/screens/bottomNav/bottom_Nav.dart';
import 'package:cattel_feed/view/sf/offline_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({super.key});

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  @override
  void initState() {
    selectRoutes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Splash Screen"),
      ),
    );
  }

  selectRoutes() async {
    String? data = await getSFData("loggedInUser");
    if (data.isEmptyOrNull) {
      nextscreenRemove(context, LoginWithNumber.routes);
    } else {
      loggedInUserInfo = UserModel.fromJson(jsonDecode(data!));
      nextscreenRemove(context, BottomNavView.routes);
    }
  }
}
