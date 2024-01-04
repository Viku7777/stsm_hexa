// ignore_for_file: use_build_context_synchronously

import 'package:cattel_feed/resource/component/custom_text.dart';
import 'package:cattel_feed/resource/component/showloading.dart';
import 'package:cattel_feed/resource/const/icon.dart';
import 'package:cattel_feed/resource/const/textstyle.dart';
import 'package:cattel_feed/resource/utils/utils.dart';
import 'package:cattel_feed/view_model/controller/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class InternetErrorView extends StatefulWidget {
  const InternetErrorView({super.key});

  @override
  State<InternetErrorView> createState() => _ErrorViewState();
}

class _ErrorViewState extends State<InternetErrorView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(.1.sw),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(IconsClass.noInternet, width: .9.sw),
                customtextWithGradentColor(
                    "Whoops! No Internet", GetTextTheme.fs26_bold),
                .025.sh.heightBox,
                Text(
                  "No Internet connect was found.\nCheck your connection or try again.",
                  style: GetTextTheme.fs16_regular,
                  textAlign: TextAlign.center,
                ),
                .05.sh.heightBox,
                customButtonWithGradent("Try Again", () async {
                  var spalashController = Get.find<SplashController>();
                  bool isInternetFound =
                      await spalashController.checkInternet();
                  if (isInternetFound) {
                    spalashController.getData(context);
                  } else {
                    Utils.flushBarErrorMessage("No Internet Found", context);
                  }
                })
              ],
            ),
          ),
          GetBuilder<SplashController>(
            builder: (controller) {
              if (controller.isloading) {
                return const ShowLoading();
              } else {
                return const SizedBox();
              }
            },
          )
        ],
      )),
    );
  }
}
