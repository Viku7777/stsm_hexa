// ignore_for_file: file_names

import 'package:cattel_feed/resource/const/colors.dart';
import 'package:cattel_feed/resource/const/textstyle.dart';
import 'package:cattel_feed/main.dart';
import 'package:cattel_feed/resource/component/custom_text.dart';
import 'package:cattel_feed/view/auth/screens/createaccountwithemail.dart';
import 'package:cattel_feed/view/auth/screens/loginwithEmail.dart';
import 'package:cattel_feed/view/auth/widget/auth_screen_tile.dart';
import 'package:cattel_feed/view/auth/widget/auth_text_field.dart';
import 'package:cattel_feed/view_model/controller/auth_controller.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.greythinColor,
        body: Stack(
          children: [
            authStartScreen([
              SizedBox(
                height: screenSize.height * .025,
              ),
              customText("Enter your phone number",
                  GetTextTheme.fs22_regular.copyWith(color: Colors.black)),
              SizedBox(
                height: screenSize.height * .05,
              ),
              Form(
                key: formKey,
                child: authTextField(
                  mobileNumber,
                  "Phone Number",
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
              SizedBox(
                height: screenSize.height * .02,
              ),
              customButtonWithGradent("Verify", () async {
                if (formKey.currentState!.validate()) {
                  var authcontroller = Get.find<AuthController>();
                  authcontroller.checkUser(
                      {"value": mobileNumber.text.trim(), "type": "phone"},
                      context);
                }
              }),
              SizedBox(
                height: screenSize.height * .02,
              ),
              Row(
                children: [
                  Expanded(
                      child: Divider(
                    color: AppColors.greythinColor,
                    thickness: 1.5,
                  )),
                  20.w.widthBox,
                  Text(
                    "OR",
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
              SizedBox(
                height: screenSize.height * .02,
              ),
              InkWell(
                  onTap: () => Get.toNamed(LoginwithEmailScreen.routes),
                  child: customTextButtonWithGradent(
                      "Login with Email", Icons.email)),
              SizedBox(
                height: screenSize.height * .02,
              ),
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: "Don’t have an account? ",
                    style: GetTextTheme.fs16_regular),
                TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => Get.to(const CreateAccountWithEmail()),
                    text: "Register here",
                    style: GetTextTheme.fs16_bold),
              ])),
            ]),
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
