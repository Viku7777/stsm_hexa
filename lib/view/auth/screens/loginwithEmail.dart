// ignore_for_file: file_names

import 'package:cattel_feed/language/language.dart';
import 'package:cattel_feed/resource/const/colors.dart';
import 'package:cattel_feed/resource/const/nextscreen.dart';
import 'package:cattel_feed/resource/const/textstyle.dart';
import 'package:cattel_feed/main.dart';
import 'package:cattel_feed/resource/component/custom_text.dart';
import 'package:cattel_feed/view/auth/screens/createaccountwithemail.dart';
import 'package:cattel_feed/view/auth/screens/loginwithNumber.dart';
import 'package:cattel_feed/view/auth/widget/auth_screen_tile.dart';
import 'package:cattel_feed/view/auth/widget/auth_text_field.dart';
import 'package:cattel_feed/view_model/controller/auth_controller.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
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
              customText(
                  LanguagesKey.enteryourEmail.tr, GetTextTheme.fs22_regular),
              SizedBox(
                height: screenSize.height * .02,
              ),
              authTextField(
                emailcontroller,
                LanguagesKey.email.tr,
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
                LanguagesKey.password.tr,
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
              customButtonWithGradent(LanguagesKey.login.tr, () async {
                if (formKey.currentState!.validate()) {
                  var controller = Get.find<AuthController>();
                  controller.loginwithEmail(
                      emailcontroller.text, passwordcontroller.text, context);
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
              SizedBox(
                height: screenSize.height * .015,
              ),
              InkWell(
                  onTap: () => nextscreen(context, LoginWithNumber.routes),
                  child: customTextButtonWithGradent(
                      LanguagesKey.loginwithNumber.tr, Icons.phone)),
              SizedBox(
                height: screenSize.height * .015,
              ),
              InkWell(
                onTap: () => nextscreen(context, CreateAccountWithEmail.routes),
                child: RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: LanguagesKey.donthaveAccount.tr,
                      style: GetTextTheme.fs16_regular),
                  TextSpan(
                      text: LanguagesKey.registerhere.tr,
                      style: GetTextTheme.fs16_bold),
                ])),
              )
            ]),
          ),
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
      ),
    );
  }
}
