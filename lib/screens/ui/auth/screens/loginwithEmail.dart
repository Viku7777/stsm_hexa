import 'package:cattel_feed/Helper/nextscreen.dart';
import 'package:cattel_feed/Helper/textstyle.dart';
import 'package:cattel_feed/const/colors.dart';
import 'package:cattel_feed/main.dart';
import 'package:cattel_feed/screens/component/custom_text.dart';
import 'package:cattel_feed/screens/ui/auth/screens/createaccountwithemail.dart';
import 'package:cattel_feed/screens/ui/auth/screens/loginwithNumber.dart';
import 'package:cattel_feed/screens/ui/auth/widget/auth_screen_tile.dart';
import 'package:cattel_feed/screens/ui/auth/widget/auth_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
  @override
  Widget build(BuildContext context) {
    return 
     Scaffold(
      body: authStartScreen([
             
      SizedBox(
        height: screenSize.height * .020,
      ),
      customText("Enter your email address", GetTextTheme.fs22_regular),
      SizedBox(
        height: screenSize.height * .02,
      ),
      authTextField(emailcontroller, "Email","user@example.com"
          ),
           SizedBox(
        height: screenSize.height * .01,
      ),
 authTextField(passwordcontroller, "Password","********"
        ),
      SizedBox(
        height: screenSize.height * .02,
      ),
      customButtonWithGradent("Login", () => null),
      SizedBox(
        height: screenSize.height * .015,
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
        height: screenSize.height * .015,
      ),
      InkWell(
        onTap: () => nextscreen(context, LoginWithNumber.routes),
        child: customTextButtonWithGradent("Login with Phone Number", Icons.phone)),
      SizedBox(
        height: screenSize.height * .015,
      ),
      InkWell(
                onTap: () => nextscreen(context, CreateAccountWithEmail.routes),

        child: RichText(
            text: TextSpan(children: [
          TextSpan(
              text: "Don’t have an account? ", style: GetTextTheme.fs16_regular),
          TextSpan(
            
            text: "Register here", style: GetTextTheme.fs16_bold),
        ])),
      )
    
  

      ]),
    );
  
  }
}