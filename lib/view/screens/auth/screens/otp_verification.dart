import 'package:cattel_feed/Helper/colors.dart';
import 'package:cattel_feed/Helper/textstyle.dart';
import 'package:cattel_feed/controller/loading_Controller/loading_controller.dart';

import 'package:cattel_feed/main.dart';
import 'package:cattel_feed/view/component/custom_text.dart';
import 'package:cattel_feed/view/component/showloading.dart';
import 'package:cattel_feed/view/screens/auth/apis/apis.dart';
import 'package:cattel_feed/view/screens/auth/widget/auth_screen_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

class OtpverificationScreen extends StatefulWidget {
  static String routes = "/otp_verification";

  const OtpverificationScreen({super.key});

  @override
  State<OtpverificationScreen> createState() => _OtpverificationScreenState();
}

class _OtpverificationScreenState extends State<OtpverificationScreen> {
  var otpController = TextEditingController();
  var controller = Get.put(LoadingController());

  @override
  Widget build(BuildContext context) {
    final data =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    String verificationID = data["verificationId"];
    bool isLogin = data["isLogin"];
    String number = data["mobileNumber"];
    List currentNumber = number.split("");
    for (var i = 0; i < currentNumber.length; i++) {
      if (i >= 3 && i < 8) {
        currentNumber[i] = "*";
      }
    }

    return Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: () async {
          // controller.updateLoadingState();
        }),
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
                  customText("Verify", GetTextTheme.fs22_regular),
                ],
              ),
              SizedBox(
                height: screenSize.height * .03,
              ),
              customText("Enter the OTP sent to +91 ${currentNumber.join("")}",
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
              customButtonWithGradent("Submit", () async {
                // controller.updateLoadingState();
                await AuthApis.verifyOtp(
                        otpController.text, verificationID, context,
                        isLoggedIn: isLogin)
                    .then((value) {
                  // controller.updateLoadingState();
                });
              }),
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
                  InkWell(
                    onTap: () {
                      controller.updateLoadingState();

                      AuthApis.sendOtp(number, context, islogin: isLogin)
                          .then((value) {
                        controller.updateLoadingState();
                      });
                    },
                    child: customText(
                        "RESEND CODE",
                        GetTextTheme.fs16_bold
                            .copyWith(color: AppColors.primaryColor)),
                  )
                ],
              )
            ], height: .4),
            GetBuilder<LoadingController>(
              builder: (controller) {
                return controller.isLoading
                    ? const ShowLoading()
                    : const SizedBox();
              },
            )
          ],
        ));
  }
}
