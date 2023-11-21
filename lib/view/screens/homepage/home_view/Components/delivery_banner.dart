import 'package:cattel_feed/Helper/colors.dart';
import 'package:cattel_feed/Helper/icon.dart';
import 'package:cattel_feed/Helper/textstyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DeliveryBannerView extends StatelessWidget {
  const DeliveryBannerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      width: Get.width,
      color: AppColors.lightBlueColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          customRow(AppIcons.codIcon, "Cash \non Delivery"),
          customRow(AppIcons.freeDeliveryIcon, "Free & Safe \nDelivery"),
          customRow(AppIcons.lowestPriceIcon, "Lowest \nPrice"),
        ],
      ),
    );
  }

  Widget customRow(String image, title) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.only(right: 5),
          padding: const EdgeInsets.all(4),
          height: 40.sp,
          width: 40.sp,
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.redColor, width: 2),
              shape: BoxShape.circle,
              color: AppColors.whiteColor),
          child: Image.asset(
            image,
            width: 20,
          ),
        ),
        Text(
          title,
          style: GetTextTheme.fs12_bold,
        )
      ],
    );
  }
}
