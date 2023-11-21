import 'package:cattel_feed/Helper/base_getters.dart';
import 'package:cattel_feed/Helper/colors.dart';
import 'package:cattel_feed/Helper/textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class TitleComponent {
  // Widget to show Location Title component in homepage (Dashboard Screen)
  static Widget locationTitleComponent() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      height: 45.h,
      width: Get.width,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xff01BBBD),
            Color(0xffFFAE00),
          ],
        ),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.location_on_outlined,
            color: AppColors.whiteColor,
            size: 25,
          ),
          AppServices.addWidth(10),
          Text(
            "Add delivery location...>>>",
            style: GetTextTheme.fs14_regular.copyWith(
              color: AppColors.whiteColor,
            ),
          ),
        ],
      ),
    );
  }

  // Widget to show title component header in screens
  // mainly use in Home Screen
  static Widget titleBannerComponent(String title) {
    return Container(
      height: 45.h,
      width: Get.width,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 151, 30, 147),
            Color(0xffE94057),
            Color(0xffF27121),
          ],
        ),
      ),
      child: Text(
        title,
        style: GetTextTheme.fs18_regular.copyWith(color: Colors.white),
      ),
    );
  }

// Widget to show product weekly Deals
  static Widget titleWidgetWithView(String title, {Function()? onTap}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.sp),
      child: InkWell(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: GetTextTheme.fs14_bold,
            ),
            Row(
              children: [
                Text(
                  "View All",
                  style: GetTextTheme.fs14_medium
                      .copyWith(color: AppColors.primaryColor),
                ),
                5.widthBox,
                Icon(Icons.arrow_circle_right_sharp,
                    color: AppColors.primaryColor),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Widget to show graident tagline in dashboard
  static Widget taglineGradient(String title) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      height: 45.h,
      width: Get.width,
      decoration: BoxDecoration(gradient: AppColors.appGradientColor),
      child: Text(
        title,
        style: GetTextTheme.fs14_bold.copyWith(color: AppColors.whiteColor),
      ),
    );
  }
}
