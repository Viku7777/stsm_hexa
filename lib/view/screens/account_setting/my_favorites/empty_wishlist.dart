import 'package:cattel_feed/Helper/nextscreen.dart';
import 'package:cattel_feed/Helper/textstyle.dart';
import 'package:cattel_feed/helper/icon.dart';
import 'package:cattel_feed/main.dart';
import 'package:cattel_feed/view/component/custom_text.dart';
import 'package:cattel_feed/view/screens/bottomNav/bottom_Nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
              "No product in you", GetTextTheme.fs28_bold),
          customtextWithGradentColor("Wishlist", GetTextTheme.fs28_bold),
          Text(
            "Just tap on ❤ to add any item to your wishlist.",
            style: GetTextTheme.fs14_regular,
          ),
          20.heightBox,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: customButtonWithGradent(
              "View Products",
              () => nextscreenRemove(context, BottomNavView.routes),
            ),
          )
        ],
      ),
    );
  }
}
