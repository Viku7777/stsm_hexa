import 'package:cattel_feed/Helper/nextscreen.dart';
import 'package:cattel_feed/Helper/textstyle.dart';
import 'package:cattel_feed/const/colors.dart';
import 'package:cattel_feed/main.dart';
import 'package:cattel_feed/screens/component/custom_text.dart';
import 'package:cattel_feed/screens/ui/auth/widget/auth_screen_tile.dart';
import 'package:cattel_feed/screens/ui/bottomNav/bottom_Nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:pinput/pinput.dart';

class OtpverificationScreen extends StatefulWidget {
  static String routes = "/otp_verification";

  const OtpverificationScreen({super.key});

  @override
  State<OtpverificationScreen> createState() => _OtpverificationScreen();
}

class _OtpverificationScreen extends State<OtpverificationScreen> {
  var otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: authStartScreen([
      SizedBox(
        height: screenSize.height * .015,
      ),
      Row(
        children: [
          IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back),
            color: Colors.black,
          ),
          customText("Verify", GetTextTheme.fs22_regular),
        ],
      ),
      SizedBox(
        height: screenSize.height * .03,
      ),
      customText(
          "Enter the OTP sent to +91 123*****21", GetTextTheme.fs14_regular),
      SizedBox(
        height: screenSize.height * .04,
      ),
      Pinput(
        controller: otpController,
        defaultPinTheme: PinTheme(
            height: 45.h,
            width: 65.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColors.greylightcolor))),
        length: 6,
      ),
      SizedBox(
        height: screenSize.height * .04,
      ),
      customButtonWithGradent("Submit", () =>Get.offAllNamed(BottomNavView.routes)),
      SizedBox(
        height: screenSize.height * .02,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Didn’t receive any code?",
            style: GetTextTheme.fs14_regular,
          ),
          customText("RESEND CODE",
              GetTextTheme.fs16_bold.copyWith(color: AppColors.primaryColor))
        ],
      )
    ], height: .4));
  }
}
