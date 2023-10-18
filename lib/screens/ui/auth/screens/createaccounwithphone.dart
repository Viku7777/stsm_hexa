
import 'package:cattel_feed/Helper/nextscreen.dart';
import 'package:cattel_feed/Helper/textstyle.dart';
import 'package:cattel_feed/const/colors.dart';
import 'package:cattel_feed/main.dart';
import 'package:cattel_feed/screens/component/custom_text.dart';
import 'package:cattel_feed/screens/ui/auth/screens/createaccountwithemail.dart';
import 'package:cattel_feed/screens/ui/auth/screens/loginwithEmail.dart';
import 'package:cattel_feed/screens/ui/auth/screens/loginwithNumber.dart';
import 'package:cattel_feed/screens/ui/auth/screens/otp_verification.dart';
import 'package:cattel_feed/screens/ui/auth/widget/auth_screen_tile.dart';
import 'package:cattel_feed/screens/ui/auth/widget/auth_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
  @override
  Widget build(BuildContext context) {
    return 
     Scaffold(
      body: authStartScreen([
             
      SizedBox(
        height: screenSize.height * .020,
      ),
      customText("Create Account", GetTextTheme.fs22_regular),
      SizedBox(
        height: screenSize.height * .02,
      ),
      authTextField(nameController, "Your Name","John Doe"
          ),
           SizedBox(
        height: screenSize.height * .01,
      ),
 authTextField(phoneController, "Your Phone Number","+91"
        ),
      SizedBox(
        height: screenSize.height * .02,
      ),
      customButtonWithGradent("Get Started", () => nextscreen(context, OtpverificationScreen.routes)),
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
        onTap: () => nextscreen(context, CreateAccountWithEmail.routes),
        child: customTextButtonWithGradent("Sign up with Email Address", Icons.email)),
      SizedBox(
        height: screenSize.height * .015,
      ),
      InkWell(
                onTap: () =>nextscreen(context, LoginWithNumber.routes),

        child: RichText(
            text: TextSpan(children: [
          TextSpan(
              text: "Already have an account?", style: GetTextTheme.fs16_regular),
          TextSpan(
            
            text: "Sign In", style: GetTextTheme.fs16_bold),
        ])),
      )
    
  

      ]),
    );
  
  }
}