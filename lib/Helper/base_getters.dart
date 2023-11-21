import 'package:cattel_feed/Helper/colors.dart';
import 'package:cattel_feed/Helper/textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppServices {
  /* Height and Width Factors */

  // // get width of the screen
  // static double getScreenWidth(BuildContext context) =>
  //     MediaQuery.of(context).size.width;

  // // get height of the screen
  // static double getScreenHeight(BuildContext context) =>
  //     MediaQuery.of(context).size.height;

  // used to add space between two vertical objects
  static addHeight(double space) => SizedBox(height: space);

  // used to add space between two horizontal objects
  static addWidth(double space) => SizedBox(width: space);

// rupees currency symbol
  static String getCurrencySymbol = "\u{20B9}";

  /* Navigation and routing */
  static pushTo(Widget screen, BuildContext context) => Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => screen));

  static pushAndReplace(Widget screen, BuildContext context) =>
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => screen));

  // navigate to next screen and remove all the screens behind
  static pushAndRemove(Widget screen, BuildContext context) =>
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => screen), (route) => false);

  // navigate to the previous screen or previous state
  static popView(BuildContext context) => Navigator.of(context).pop();

  // function to unfocus the keyboard on tap on screen
  static keyboardUnfocus(BuildContext context) =>
      FocusScope.of(context).unfocus();

  static bool isDarkMode(BuildContext context) {
    var brightness = Theme.of(context).brightness;
    return brightness == Brightness.dark;
  }

  // This Function use to get Space between Two Widgets
  static customDivider(double padding) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: padding),
      child: Divider(
        thickness: 1,
        color: AppColors.greyColor.withOpacity(0.4),
      ),
    );
  }

  // this function use to show Empty Icon with Error
  static emptyIcon(image, title, error) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 35.h),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            height: 90.sp,
          ),
          AppServices.addHeight(5.h),
          Text(title, style: GetTextTheme.fs18_bold),
          AppServices.addHeight(15.h),
          Text(
            error,
            textAlign: TextAlign.center,
            style:
                GetTextTheme.fs14_regular.copyWith(color: AppColors.greyColor),
          ),
        ],
      ),
    );
  }
}
