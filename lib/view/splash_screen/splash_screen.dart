// ignore_for_file: use_build_context_synchronously

import 'package:cattel_feed/resource/const/colors.dart';
import 'package:cattel_feed/resource/const/icon.dart';
import 'package:cattel_feed/resource/const/textstyle.dart';
import 'package:cattel_feed/services/firebase_Analytics_services.dart';
import 'package:cattel_feed/view/error_view/error_view.dart';
import 'package:cattel_feed/view_model/controller/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(IconsClass.appIcon, height: 100.h),
            Text(
              "Save Time Save Money",
              style: GetTextTheme.fs14_medium,
            ),
            10.h.heightBox,
            SizedBox(
              height: 30,
              width: 30,
              child: CircularProgressIndicator(
                color: AppColors.primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  selectRoutes() async {
    var spalashController = Get.find<SplashController>();
    bool isInternetFound = await spalashController.checkInternet();
    if (isInternetFound) {
      spalashController.getData(context);
    } else {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const InternetErrorView(),
      ));
    }
  }
}
