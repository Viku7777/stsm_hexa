import 'package:cattel_feed/main.dart';
import 'package:cattel_feed/resource/component/custom_text.dart';
import 'package:cattel_feed/resource/const/icon.dart';
import 'package:cattel_feed/view_model/controller/app_data_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class EmptyCartView extends StatefulWidget {
  static String routes = "/empty_cart";
  const EmptyCartView({super.key});

  @override
  State<EmptyCartView> createState() => _EmptyCartViewState();
}

class _EmptyCartViewState extends State<EmptyCartView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          (screenSize.height * 0.15).heightBox,
          Image.asset(IconsClass.emptyCart, height: 219.h, width: 234.w),
          10.h.heightBox,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: customButtonWithGradent(
              "Start Shopping",
              () {
                var controller = Get.find<AppData>();
                controller.updateScreenIndex(0);
              },
            ),
          )
        ],
      ),
    );
  }
}
