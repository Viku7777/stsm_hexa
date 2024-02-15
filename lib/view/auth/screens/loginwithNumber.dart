// ignore_for_file: file_names

import 'package:cattel_feed/language/language.dart';
import 'package:cattel_feed/resource/const/colors.dart';
import 'package:cattel_feed/resource/const/textstyle.dart';
import 'package:cattel_feed/main.dart';
import 'package:cattel_feed/resource/component/custom_text.dart';
import 'package:cattel_feed/view/auth/screens/createaccountwithemail.dart';
import 'package:cattel_feed/view/auth/screens/loginwithEmail.dart';
import 'package:cattel_feed/view/auth/widget/auth_screen_tile.dart';
import 'package:cattel_feed/view/auth/widget/auth_text_field.dart';
import 'package:cattel_feed/view/bottomNav/bottom_Nav.dart';
import 'package:cattel_feed/view_model/controller/auth_controller.dart';
import 'package:cattel_feed/view_model/controller/logged_in_user_controller.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginWithNumber extends StatefulWidget {
  static String routes = "/loginnumber";
  const LoginWithNumber({super.key});

  @override
  State<LoginWithNumber> createState() => _LoginWithNumberState();
}

class _LoginWithNumberState extends State<LoginWithNumber> {
  var mobileNumber = TextEditingController();
  var formKey = GlobalKey<FormState>();
  var loggedInUser = Get.find<LoggedInUserController>();

  @override
  void initState() {
    loggedInUser.isGuestUser = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.greythinColor,
        body: Stack(
          children: [
            authStartScreen([
              (screenSize.height * .025).heightBox,
              customText(LanguagesKey.enterMobileNumber.tr,
                  GetTextTheme.fs22_regular.copyWith(color: Colors.black)),
              (screenSize.height * .05).heightBox,
              Form(
                key: formKey,
                child: authTextField(
                  mobileNumber,
                  LanguagesKey.phoneNumber.tr,
                  "+91 ",
                  keyboardType: TextInputType.phone,
                  maxLength: 10,
                  isPrefix: true,
                  validator: (text) {
                    if (text!.length <= 9) {
                      return "Please enter a valid mobile no. ";
                    }
                    return null;
                  },
                ),
              ),
              (screenSize.height * .02).heightBox,
              customButtonWithGradent(LanguagesKey.verify.tr, () async {
                if (formKey.currentState!.validate()) {
                  var authcontroller = Get.find<AuthController>();
                  authcontroller.checkUser(
                      {"value": mobileNumber.text.trim(), "type": "phone"},
                      context);
                }
              }),
              (screenSize.height * .02).heightBox,
              Row(
                children: [
                  Expanded(
                      child: Divider(
                    color: AppColors.greythinColor,
                    thickness: 1.5,
                  )),
                  20.w.widthBox,
                  Text(
                    LanguagesKey.oR.tr,
                    style: GetTextTheme.fs16_regular,
                  ),
                  20.w.widthBox,
                  Expanded(
                      child: Divider(
                    color: AppColors.greythinColor,
                    thickness: 1.5,
                  )),
                ],
              ),
              (screenSize.height * .02).heightBox,
              InkWell(
                  onTap: () => Get.toNamed(LoginwithEmailScreen.routes),
                  child: customTextButtonWithGradent(
                      LanguagesKey.loginWithEmail.tr, Icons.email)),
              (screenSize.height * .02).heightBox,
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: LanguagesKey.donthaveAccount.tr,
                    style: GetTextTheme.fs16_regular),
                TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => Get.to(const CreateAccountWithEmail()),
                    text: LanguagesKey.registerhere.tr,
                    style: GetTextTheme.fs16_bold),
              ])),
              (screenSize.height * .02).heightBox,
              Row(
                children: [
                  Expanded(
                      child: Divider(
                    color: AppColors.greythinColor,
                    thickness: 1.5,
                  )),
                  10.w.widthBox,
                  Text(
                    LanguagesKey.oR.tr,
                    style: GetTextTheme.fs16_regular,
                  ),
                  20.w.widthBox,
                  Expanded(
                      child: Divider(
                    color: AppColors.greythinColor,
                    thickness: 1.5,
                  )),
                ],
              ),
              (screenSize.height * .02).heightBox,
              TextButton(
                  onPressed: () {
                    loggedInUser.isGuestUser = true;
                    Get.to(() => const BottomNavView());
                  },
                  child: Text(
                    LanguagesKey.loginAsGuest.tr,
                    style: const TextStyle(color: Colors.black),
                  ))
            ], height: .62),
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
