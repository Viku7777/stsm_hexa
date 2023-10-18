import 'package:cattel_feed/Helper/nextscreen.dart';
import 'package:cattel_feed/Helper/textstyle.dart';
import 'package:cattel_feed/const/colors.dart';
import 'package:cattel_feed/main.dart';
import 'package:cattel_feed/screens/component/custom_text.dart';
import 'package:cattel_feed/screens/ui/auth/screens/createaccountwithemail.dart';
import 'package:cattel_feed/screens/ui/auth/screens/createaccounwithphone.dart';
import 'package:cattel_feed/screens/ui/auth/screens/loginwithEmail.dart';
import 'package:cattel_feed/screens/ui/auth/widget/auth_screen_tile.dart';
import 'package:cattel_feed/screens/ui/auth/widget/auth_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginWithNumber extends StatefulWidget {
  static String routes = "/loginnumber";
  const LoginWithNumber({super.key});

  @override
  State<LoginWithNumber> createState() => _LoginWithNumberState();
}

class _LoginWithNumberState extends State<LoginWithNumber> {
  var mobileNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
        body: authStartScreen(
          [
      SizedBox(
        height: screenSize.height * .025,
      ),
      customText("Enter your phone number", GetTextTheme.fs22_regular.copyWith(color: Colors.black)),
      SizedBox(
        height: screenSize.height * .05,
      ),
      authTextField(mobileNumber, "Phone Number", "+91",
          keyboardType: TextInputType.phone, maxLength: 10),
      SizedBox(
        height: screenSize.height * .02,
      ),
      customButtonWithGradent("Verify", () =>nextscreen(context,  CreateAccountWithPhone.routes)),
      SizedBox(
        height: screenSize.height * .02,
      ),
      Row(
        children: [
          Expanded(
              child: Divider(
            color: AppColors.gerythinColor,
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
            color: AppColors.gerythinColor,
            thickness: 1.5,
          )),
        ],
      ),
      SizedBox(
        height: screenSize.height * .02,
      ),
      InkWell(
        onTap: () => nextscreen(context, LoginwithEmailScreen.routes),
        child: customTextButtonWithGradent("Login with Email", Icons.email)),
      SizedBox(
        height: screenSize.height * .02,
      ),
      InkWell(
        onTap: () => nextscreen(context, CreateAccountWithEmail.routes),
        child: RichText(
            text: TextSpan(children: [
          TextSpan(
              text: "Don’t have an account? ", style: GetTextTheme.fs16_regular),
          TextSpan(text: "Register here", style: GetTextTheme.fs16_bold),
        ])),
      )
    ]));
  
  }
}
