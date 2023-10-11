import 'package:flutter/material.dart';

Color maincolor =  const Color(0xff1F84AF);
List categoriesColor = [
  const Color(0xffE1F1E8),
  const Color(0xffFFECE8),
  const Color(0xffF1EDFC),
  const Color(0xffFDF4E2),
];


List textColors = [
  const Color(0xff29906D),
  const Color(0xffFE6943),
  
  const Color(0xff9376E2),
  const Color(0xffFBB400),
];


// all the colors used in the app are stored in AppColors
class AppColors {
  static const Color blackColor = Color(0xff000000);
  static const Color whiteColor = Colors.white;
  static const Color greyColor = Colors.grey;
  static  Color primaryColor = Color(0xff54B435);
  static Color gerythinColor = const Color(0xffEEEEEE);
  static Color greylightcolor = const Color(0xffB5B5B5);
  static Color greenColor = Color.fromRGBO(31, 175, 56, 1);
  
  static  Color redColor = const Color(0xffDD0000);

  static LinearGradient appGradientColor = const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [Color(0xff0336FF), Color(0xffE384FF)]);
  static LinearGradient appShimmerGradientColor = LinearGradient(colors: [
    AppColors.greyColor.withOpacity(0.3),
    AppColors.whiteColor,
    AppColors.greyColor.withOpacity(0.1),
  ]);
}


LinearGradient titleWidgetGradient =  const LinearGradient(colors: [
       Color(0xff01BBBD),
       Color(0xffFFAE00),
            ]);