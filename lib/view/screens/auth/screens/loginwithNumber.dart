// ignore_for_file: file_names

import 'dart:convert';

import 'package:cattel_feed/Helper/colors.dart';
import 'package:cattel_feed/Helper/nextscreen.dart';
import 'package:cattel_feed/Helper/textstyle.dart';
import 'package:cattel_feed/controller/loading_Controller/loading_controller.dart';

import 'package:cattel_feed/main.dart';
import 'package:cattel_feed/model/user_model.dart';
import 'package:cattel_feed/view/component/custom_text.dart';
import 'package:cattel_feed/view/component/showloading.dart';
import 'package:cattel_feed/view/screens/auth/apis/apis.dart';
import 'package:cattel_feed/view/screens/auth/screens/createaccountwithemail.dart';
import 'package:cattel_feed/view/screens/auth/screens/createaccounwithphone.dart';
import 'package:cattel_feed/view/screens/auth/screens/loginwithEmail.dart';
import 'package:cattel_feed/view/screens/auth/screens/otp_verification.dart';
import 'package:cattel_feed/view/screens/auth/widget/auth_screen_tile.dart';
import 'package:cattel_feed/view/screens/auth/widget/auth_text_field.dart';
import 'package:cattel_feed/view/screens/bottomNav/bottom_Nav.dart';
import 'package:cattel_feed/view/sf/offline_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  var controller = Get.put(LoadingController());
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            // String users = await getSFData("loggedInUser");
            // if (users.contains("null")) {
            //   print("not found");
            // } else {
            //   UserModel userData = UserModel.fromJson(jsonDecode(users));
            // }
          },
        ),
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
                  controller.updateLoadingState();
                  await AuthApis.loginwithPhone(mobileNumber.text, context)
                      .then((value) {
                    controller.updateLoadingState();
                  });
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
                  onTap: () => nextscreen(context, LoginwithEmailScreen.routes),
                  child: customTextButtonWithGradent(
                      "Login with Email", Icons.email)),
              SizedBox(
                height: screenSize.height * .02,
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
