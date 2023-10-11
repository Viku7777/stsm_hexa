


import 'package:cattel_feed/Helper/textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:velocity_x/velocity_x.dart';

Widget customersReviewtile()=>      Container(
              height: 115.h,
              width: Get.width,
              decoration: BoxDecoration(
                  border:
                      Border(bottom: BorderSide(color: Colors.grey.shade300))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(


                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundColor: const Color(0xffEAFDE1),
                        child: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.person_outlined),
                            color: Colors.black),
                      ),
                                      10.w.widthBox,
                     Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        Text("user name",style: GetTextTheme.fs14_bold,),
                            RatingBar.builder(
                          initialRating: 3,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemSize: 13.sp,
                          itemPadding: EdgeInsets.symmetric(horizontal: 1.w),
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {
                 
                          },
                        ),
                      ],)
                    ],
                  ),
                  Text(
                    "Lorem ipsum dolor sit amet consectetur. Eu fermentum quam urna diam integer hendrerit nec risus.",
                    style: GetTextTheme.fs14_regular
                        .copyWith(color: Colors.grey.shade500),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      "21 min ago",
                      style: GetTextTheme.fs14_regular
                          .copyWith(color: Colors.grey.shade500),
                    ),
                  )
                ],
              ),
            );
        