import 'dart:math';

import 'package:cattel_feed/Helper/colors.dart';
import 'package:cattel_feed/Helper/nextscreen.dart';
import 'package:cattel_feed/Helper/textstyle.dart';
import 'package:cattel_feed/controller/loading_Controller/loading_controller.dart';

import 'package:cattel_feed/main.dart';
import 'package:cattel_feed/view/component/custom_text.dart';
import 'package:cattel_feed/view/component/showloading.dart';
import 'package:cattel_feed/view/screens/auth/apis/apis.dart';
import 'package:cattel_feed/view/screens/auth/screens/createaccountwithemail.dart';
import 'package:cattel_feed/view/screens/auth/screens/loginwithNumber.dart';
import 'package:cattel_feed/view/screens/auth/widget/auth_screen_tile.dart';
import 'package:cattel_feed/view/screens/auth/widget/auth_text_field.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginwithEmailScreen extends StatefulWidget {
  static String routes = "/loginemail";

  const LoginwithEmailScreen({super.key});

  @override
  State<LoginwithEmailScreen> createState() => _LoginwithEmailScreenState();
}

class _LoginwithEmailScreenState extends State<LoginwithEmailScreen> {
  var emailcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();
  var controller = Get.put(LoadingController());
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greythinColor,
      body: Stack(
        children: [
          Form(
            key: formKey,
            child: authStartScreen(height: .58, [
              SizedBox(
                height: screenSize.height * .03,
              ),
              customText("Enter your email address", GetTextTheme.fs22_regular),
              SizedBox(
                height: screenSize.height * .02,
              ),
              authTextField(
                emailcontroller,
                "Email",
                "user@example.com",
                validator: (v) {
                  if (!EmailValidator.validate(emailcontroller.text)) {
                    return "Please enter a valid email address";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: screenSize.height * .01,
              ),
              authTextField(
                passwordcontroller,
                "Password",
                "********",
                validator: (v) {
                  if (v!.isEmpty) {
                    return "Please enter a vaild password";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: screenSize.height * .02,
              ),
              customButtonWithGradent("Login", () async {
                if (formKey.currentState!.validate()) {
                  controller.updateLoadingState();
                  AuthApis.loginwithEmail(emailcontroller.text,
                          passwordcontroller.text, context)
                      .then((value) => controller.updateLoadingState());
                }
              }),
              SizedBox(
                height: screenSize.height * .015,
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
                height: screenSize.height * .015,
              ),
              InkWell(
                  onTap: () => nextscreen(context, LoginWithNumber.routes),
                  child: customTextButtonWithGradent(
                      "Login with Phone Number", Icons.phone)),
              SizedBox(
                height: screenSize.height * .015,
              ),
              InkWell(
                onTap: () => nextscreen(context, CreateAccountWithEmail.routes),
                child: RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: "Don’t have an account? ",
                      style: GetTextTheme.fs16_regular),
                  TextSpan(
                      text: "Register here", style: GetTextTheme.fs16_bold),
                ])),
              )
            ]),
          ),
          GetBuilder<LoadingController>(
            builder: (controller) {
              return controller.isLoading
                  ? const ShowLoading()
                  : const SizedBox();
            },
          )
        ],
      ),
    );
  }
}
