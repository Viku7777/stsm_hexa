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
import 'package:cattel_feed/view/screens/auth/screens/loginwithEmail.dart';
import 'package:cattel_feed/view/screens/auth/screens/loginwithNumber.dart';
import 'package:cattel_feed/view/screens/auth/screens/otp_verification.dart';
import 'package:cattel_feed/view/screens/auth/widget/auth_screen_tile.dart';
import 'package:cattel_feed/view/screens/auth/widget/auth_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:velocity_x/velocity_x.dart';

class CreateAccountWithPhone extends StatefulWidget {
  static String routes = "/create_account_phone";

  const CreateAccountWithPhone({super.key});

  @override
  State<CreateAccountWithPhone> createState() => _CreateAccountWithPhoneState();
}

class _CreateAccountWithPhoneState extends State<CreateAccountWithPhone> {
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var controller = Get.put(LoadingController());
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final mobileNumber = ModalRoute.of(context)!.settings.arguments.toString();
    phoneController.text = mobileNumber;
    return Scaffold(
      backgroundColor: AppColors.greythinColor,
      body: Stack(
        children: [
          authStartScreen(height: .60, [
            SizedBox(
              height: screenSize.height * .020,
            ),
            customText("Create Account", GetTextTheme.fs22_regular),
            SizedBox(
              height: screenSize.height * .03,
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
                      height: screenSize.height * .01,
                    ),
                    authTextField(
                      phoneController,
                      "Your Phone Number",
                      "+91 ",
                      maxLength: 10,
                      keyboardType: TextInputType.number,
                      isPrefix: true,
                      validator: (v) {
                        if (v!.length <= 9) {
                          return "Please enter a valid mobile no. ";
                        }
                        return null;
                      },
                    ),
                  ],
                )),
            SizedBox(
              height: screenSize.height * .02,
            ),
            customButtonWithGradent("Get Started", () async {
              if (formKey.currentState!.validate()) {
                controller.updateLoadingState();
              }
              UserModel user = UserModel(
                  uid: "",
                  authenticationMethod: "phone",
                  name: nameController.text,
                  isCustomer: true,
                  phone: phoneController.text,
                  createdAt: DateTime.now().toIso8601String(),
                  addresses: [],
                  devicesToken: []);
              await AuthApis.signupwithPhone(context, user).then((value) {
                controller.updateLoadingState();
              });
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
                onTap: () => nextscreen(context, CreateAccountWithEmail.routes),
                child: customTextButtonWithGradent(
                    "Sign up with Email Address", Icons.email)),
            SizedBox(
              height: screenSize.height * .015,
            ),
            InkWell(
              onTap: () => nextscreen(context, LoginWithNumber.routes),
              child: RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: "Already have an account?",
                    style: GetTextTheme.fs16_regular),
                TextSpan(text: "Sign In", style: GetTextTheme.fs16_bold),
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
      ),
    );
  }
}
