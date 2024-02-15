import 'package:cattel_feed/language/language.dart';
import 'package:cattel_feed/resource/const/colors.dart';
import 'package:cattel_feed/resource/const/textstyle.dart';
import 'package:cattel_feed/main.dart';
import 'package:cattel_feed/resource/component/custom_text.dart';
import 'package:cattel_feed/resource/utils/utils.dart';
import 'package:cattel_feed/view/auth/widget/auth_screen_tile.dart';
import 'package:cattel_feed/view_model/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

class OtpverificationScreen extends StatefulWidget {
  static String routes = "/otp_verification";
  static String verificationID = "";
  static String name = "";
  static bool isCreateProfile = false;
  const OtpverificationScreen({super.key});

  @override
  State<OtpverificationScreen> createState() => _OtpverificationScreenState();
}

class _OtpverificationScreenState extends State<OtpverificationScreen> {
  var otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    String number = Get.arguments;
    List currentNumber = number.split("");
    for (var i = 0; i < currentNumber.length; i++) {
      if (i >= 3 && i < 8) {
        currentNumber[i] = "*";
      }
    }

    return Scaffold(
        backgroundColor: AppColors.greythinColor,
        body: Stack(
          children: [
            authStartScreen([
              SizedBox(
                height: screenSize.height * .015,
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(Icons.arrow_back),
                    color: Colors.black,
                  ),
                  customText(LanguagesKey.verify.tr, GetTextTheme.fs22_regular),
                ],
              ),
              SizedBox(
                height: screenSize.height * .03,
              ),
              customText(
                  "${LanguagesKey.enterTheOtp.tr} +91 ${currentNumber.join("")}",
                  GetTextTheme.fs14_regular),
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
              customButtonWithGradent(LanguagesKey.submit.tr, () async {
                if (otpController.length == 6) {
                  var controller = Get.find<AuthController>();
                  controller.verifyOtp(
                      otpController.text,
                      context,
                      OtpverificationScreen.isCreateProfile,
                      OtpverificationScreen.name,
                      number);
                } else {
                  Utils.flushBarErrorMessage(
                      "Please enter a vaild otp", context);
                }
              }),
              SizedBox(
                height: screenSize.height * .02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    LanguagesKey.didnotreceivecode.tr,
                    style: GetTextTheme.fs14_regular,
                  ),
                  InkWell(
                    onTap: () {},
                    child: customText(
                        LanguagesKey.rESENDCODE.tr,
                        GetTextTheme.fs16_bold
                            .copyWith(color: AppColors.primaryColor)),
                  )
                ],
              )
            ], height: .4),
            GetBuilder<AuthController>(
              builder: (controller) {
                return controller.loading
                    ? Container(
                        height: screenSize.height,
                        width: screenSize.width,
                        color: Colors.black.withOpacity(.3),
                        alignment: Alignment.center,
                        child: CircularProgressIndicator(
                          color: AppColors.primaryColor,
                        ),
                      )
                    : const SizedBox();
              },
            )
          ],
        ));
  }
}
