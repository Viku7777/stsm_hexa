import 'package:cattel_feed/Helper/textstyle.dart';
import 'package:cattel_feed/const/colors.dart';
import 'package:cattel_feed/const/icon.dart';
import 'package:cattel_feed/screens/component/appbar_component.dart';
import 'package:cattel_feed/screens/component/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

class ReferEarnView extends StatelessWidget {
  static String routes = "/account_&_settings/refer_earn";

  ReferEarnView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar("Refer & Earn"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Column(
          children: [
            Image.asset(
              IconsClass.referIcon,
              height: 300.h,
            ),
            customtextWithGradentColor(
              "Earn Coins",
              GetTextTheme.fs28_bold,
            ),
            Text(
              "For every new user join with your \nreferral code",
              textAlign: TextAlign.center,
              style: GetTextTheme.fs18_regular,
            ),
            Text(
              "Share your referral link and\nearn assured coins",
              textAlign: TextAlign.center,
              style: GetTextTheme.fs14_regular
                  .copyWith(color: AppColors.greylightcolor),
            ),
            20.h.heightBox,
            Container(
              height: 44.h,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 10.w),
              decoration: kGradientBoxDecoration,
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Container(
                    alignment: Alignment.center,
                    decoration: kInnerDecoration,
                    child: customtextWithGradentColor(
                        "1sg51fgs2f1gs5gsf", GetTextTheme.fs16_regular)),
              ),
            ),
                        20.h.heightBox,

            Text(
              "Click the share button to send your code\nto your contacts.",
              textAlign: TextAlign.center,
              style: GetTextTheme.fs14_regular
                  .copyWith(color: AppColors.greylightcolor),
            ),
            10.h.heightBox,
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 10.w),
              child: customButtonWithGradent("Share", () => null),
            )
          ],
        ),
      ),
    );
  }

  final kInnerDecoration = BoxDecoration(
    color: Colors.white,
    border: Border.all(color: Colors.white),
    borderRadius: BorderRadius.circular(12.sp),
  );
  final kGradientBoxDecoration = BoxDecoration(
    gradient: titleWidgetGradient,
    color: Colors.white,
    borderRadius: BorderRadius.circular(12.sp),
  );
}
