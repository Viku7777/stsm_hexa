import 'package:cattel_feed/Helper/colors.dart';
import 'package:cattel_feed/Helper/nextscreen.dart';
import 'package:cattel_feed/Helper/textstyle.dart';
import 'package:cattel_feed/global/global.dart';

import 'package:cattel_feed/main.dart';
import 'package:cattel_feed/view/component/gridview.dart';
import 'package:cattel_feed/view/screens/address/all_address/all_address.dart';
import 'package:cattel_feed/view/screens/auth/screens/loginwithNumber.dart';
import 'package:cattel_feed/view/screens/cart_view/cart_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

AppBar customAppBar(BuildContext context) {
  return AppBar(
    toolbarHeight: 86.h,
    elevation: 0,
    flexibleSpace: Container(
      decoration: BoxDecoration(gradient: titleWidgetGradient),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10.sp),
          child: Column(
            children: [
              Row(
                children: [
                  const InkWell(
                    child: Icon(
                      Icons.location_on,
                      color: Colors.white,
                    ),
                  ),
                  10.w.widthBox,
                  Expanded(
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            if (loggedInUserInfo != null) {
                              nextscreen(context, AllAddressView.routes);
                            } else {
                              nextscreenRemove(context, LoginWithNumber.routes);
                            }
                          },
                          child: SizedBox(
                            width: screenSize.width * .7,
                            child: Text(userCurrentAddress,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: GetTextTheme.fs16_medium
                                    .copyWith(color: Colors.white)),
                          ),
                        ),
                        const Icon(
                          Icons.arrow_drop_down,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  const Icon(
                    Icons.notifications,
                    color: Colors.white,
                  )
                ],
              ),
              8.h.heightBox,
              Row(
                children: [
                  10.w.widthBox,
                  Expanded(
                      child: TextField(
                    cursorColor: AppColors.primaryColor,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      fillColor: const Color(
                        0xffE1E1E1,
                      ),
                      filled: true,
                      hintStyle: const TextStyle(fontSize: 12),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(30)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(30)),
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Colors.black54,
                      ),
                      hintText: "Search your desired items or stores",
                    ),
                  )),
                  10.w.widthBox,
                  InkWell(
                      onTap: () => nextscreen(context, CartView.route),
                      child: const Icon(
                        Icons.shopping_cart,
                        color: Colors.white,
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    ),
  );
}

customListview(int count, Function(int) currentindex,
        {bool isverticalAxis = false}) =>
    ListView.separated(
        separatorBuilder: (context, index) => 10.w.widthBox,
        shrinkWrap: true,
        scrollDirection: isverticalAxis ? Axis.vertical : Axis.horizontal,
        itemCount: count,
        itemBuilder: (context, index) {
          return currentindex(index);
        });

customGridVIew(
        int count, double aspectRatio, int itemInRow, Function(int) child,
        {bool isScrollAble = false,
        double crossAxisSpacing = 7,
        double mainAxisSpacing = 7}) =>
    GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        shrinkWrap: true,
        physics: isScrollAble
            ? const BouncingScrollPhysics()
            : const NeverScrollableScrollPhysics(),
        itemCount: count,
        gridDelegate: customgridDelegate(itemInRow, aspectRatio,
            crossAxisSpacing: crossAxisSpacing,
            mainAxisSpacing: mainAxisSpacing),
        itemBuilder: (context, index) => child(index));

decorationWithImage(String image) {
  return BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      image: DecorationImage(image: NetworkImage(image), fit: BoxFit.cover),
      color: Colors.red);
}
