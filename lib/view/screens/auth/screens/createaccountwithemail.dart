import 'package:cattel_feed/Helper/colors.dart';
import 'package:cattel_feed/Helper/nextscreen.dart';
import 'package:cattel_feed/Helper/textstyle.dart';
import 'package:cattel_feed/controller/loading_Controller/loading_controller.dart';

import 'package:cattel_feed/main.dart';
import 'package:cattel_feed/view/component/custom_text.dart';
import 'package:cattel_feed/view/component/showloading.dart';
import 'package:cattel_feed/view/screens/auth/apis/apis.dart';
import 'package:cattel_feed/view/screens/auth/screens/createaccounwithphone.dart';
import 'package:cattel_feed/view/screens/auth/screens/loginwithEmail.dart';
import 'package:cattel_feed/view/screens/auth/widget/auth_screen_tile.dart';
import 'package:cattel_feed/view/screens/auth/widget/auth_text_field.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class CreateAccountWithEmail extends StatefulWidget {
  static String routes = "/ create_account_email";

  const CreateAccountWithEmail({super.key});

  @override
  State<CreateAccountWithEmail> createState() => _CreateAccountWithEmailState();
}

class _CreateAccountWithEmailState extends State<CreateAccountWithEmail> {
  var emailcontroller = TextEditingController();
  var nameController = TextEditingController();
  var passwordcontroller = TextEditingController();
  var formKey = GlobalKey<FormState>();
  var controller = Get.put(LoadingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greythinColor,
      body: Stack(
        children: [
          authStartScreen([
            SizedBox(
              height: screenSize.height * .012,
            ),
            customText("Create Account", GetTextTheme.fs22_regular),
            SizedBox(
              height: screenSize.height * .02,
            ),
            Form(
                key: formKey,
                child: Column(
                  children: [
                    authTextField(
                      nameController,
                      "Your Name",
                      "John Doe",
                      validator: (v) {
                        if (v!.isEmpty) {
                          return "Please enter your name";
                        }
                        return null;
                      },
                    ),
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
                  ],
                )),
            customButtonWithGradent("Get Started", () {
              if (formKey.currentState!.validate()) {
                controller.updateLoadingState();
                AuthApis.signupwithEmail(emailcontroller.text,
                        passwordcontroller.text, nameController.text, context)
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
                onTap: () => nextscreenwithargu(
                    context, CreateAccountWithPhone.routes, ""),
                child: customTextButtonWithGradent(
                    "Sign up with Phone Number", Icons.phone)),
            SizedBox(
              height: screenSize.height * .015,
            ),
            InkWell(
              onTap: () => nextscreen(context, LoginwithEmailScreen.routes),
              child: RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: "Already have an account? ",
                    style: GetTextTheme.fs16_regular),
                TextSpan(text: "Sign In", style: GetTextTheme.fs16_bold),
              ])),
            ),
          ], height: .68),
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
