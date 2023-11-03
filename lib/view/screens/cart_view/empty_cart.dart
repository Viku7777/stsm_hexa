import 'package:cattel_feed/Helper/nextscreen.dart';
import 'package:cattel_feed/helper/icon.dart';
import 'package:cattel_feed/main.dart';
import 'package:cattel_feed/view/component/custom_text.dart';
import 'package:cattel_feed/view/screens/bottomNav/bottom_Nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

class EmptyCartView extends StatefulWidget {
  static String routes = "/empty_cart";
  const EmptyCartView({super.key});

  @override
  State<EmptyCartView> createState() => _EmptyCartViewState();
}

class _EmptyCartViewState extends State<EmptyCartView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          (screenSize.height * 0.15).heightBox,
          Image.asset(IconsClass.emptyCart, height: 219.h, width: 234.w),
          10.h.heightBox,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: customButtonWithGradent(
              "Start Shopping",
              () => nextscreenRemove(context, BottomNavView.routes),
            ),
          )
        ],
      ),
    );
  }
}
