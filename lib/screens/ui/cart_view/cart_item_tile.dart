import 'package:cattel_feed/Helper/textstyle.dart';
import 'package:cattel_feed/backend/dummyData.dart';
import 'package:cattel_feed/const/colors.dart';
import 'package:cattel_feed/screens/component/custom_text.dart';
import 'package:cattel_feed/screens/component/showPrice.dart';
import 'package:cattel_feed/screens/ui/homepage/item_details/show_more_option_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

Widget showCartItem()=>    Container(
            height: 120.h,
            color: Colors.white,
            padding: EdgeInsets.symmetric(
              horizontal: 10.w,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    showmoreOptionTile(dummyitems[2]["image"],
                        height: 70, width: 70),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        customText(
                            "Stylish Casual T-Shirt", GetTextTheme.fs14_bold),
                        2.h.heightBox,
                        customshowPrice("350", "250"),
                        2.h.heightBox,
                        Row(
                          children: [
                            customText("Size : XL", GetTextTheme.fs10_regular),
                            10.w.widthBox,
                            customText(
                                "Color : Blue", GetTextTheme.fs10_regular)
                          ],
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.delete_outline_sharp,
                              color: Colors.black,
                            )),
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.add_circle_outline_rounded,
                                  color: Colors.black,
                                )),
                            customText("1", GetTextTheme.fs16_bold),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.remove_circle_outline_outlined,
                                  color: Colors.black,
                                )),
                          ],
                        )
                      ],
                    )
                  ],
                ),
                Container(
                  height: 25.h,
                  color: AppColors.gerythinColor,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      customText(
                          "Sold by : xyz store", GetTextTheme.fs12_regular),
                      customText("Free delivery", GetTextTheme.fs12_regular)
                    ],
                  ),
                )
              ],
            ),
          );
        