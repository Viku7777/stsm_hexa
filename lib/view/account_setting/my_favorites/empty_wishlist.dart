import 'package:cattel_feed/language/language.dart';
import 'package:cattel_feed/resource/const/icon.dart';
import 'package:cattel_feed/resource/const/nextscreen.dart';
import 'package:cattel_feed/resource/const/textstyle.dart';
import 'package:cattel_feed/main.dart';
import 'package:cattel_feed/resource/component/custom_text.dart';
import 'package:cattel_feed/view/bottomNav/bottom_Nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class EmptyWishlistVIew extends StatelessWidget {
  const EmptyWishlistVIew({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          (screenSize.height * 0.08).heightBox,
          Image.asset(IconsClass.wishlist, height: 219.h, width: 234.w),
          5.h.heightBox,
          customtextWithGradentColor(
              LanguagesKey.noProductInWishList.tr, GetTextTheme.fs28_bold),
          customtextWithGradentColor(
              LanguagesKey.wishlist.tr, GetTextTheme.fs28_bold),
          Text(
            LanguagesKey.wishlistMessage.tr,
            style: GetTextTheme.fs14_regular,
          ),
          20.heightBox,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: customButtonWithGradent(
              LanguagesKey.viewProduct.tr,
              () => nextscreenRemove(context, BottomNavView.routes),
            ),
          )
        ],
      ),
    );
  }
}
