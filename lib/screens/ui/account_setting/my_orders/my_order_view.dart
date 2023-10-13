import 'package:cattel_feed/Helper/textstyle.dart';
import 'package:cattel_feed/const/colors.dart';
import 'package:cattel_feed/screens/component/appbar_component.dart';
import 'package:cattel_feed/screens/ui/account_setting/my_orders/my_order_tiel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

class MyOrderView extends StatefulWidget {
  static String routes = "/account_&_settings/my_order";
  const MyOrderView({super.key});

  @override
  State<MyOrderView> createState() => _MyOrderViewState();
}

class _MyOrderViewState extends State<MyOrderView> {
  String select = "Delivered";
    List orderType = ["Delivered", "Ongoing", "Cancelled"];

  List orderDetails = [
    "Buy again",
    "View Details",
    "Track Order",
    Icons.more_vert
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar("My Orders"),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        children: [
          Container(
            height: 40.h,
            padding: EdgeInsets.all(5.sp),
            decoration: BoxDecoration(
                color: AppColors.gerythinColor,
                borderRadius: BorderRadius.circular(5)),
            child: Row(
                children: orderType.map((e) {
              String current = e.toString();
              return Expanded(
                child: InkWell(
                  onTap: () => setState(() {
                    select = current;
                  }),
                  child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: current.contains(select)
                              ? Colors.white
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(5)),
                      child: Text(
                        e,
                        style: GetTextTheme.fs16_regular,
                      )),
                ),
              );
            }).toList()),
          ),
     5.h.heightBox,
     MYOrderTile(tapClick: (p0){
      setState(() {
        select=p0;
      });
     }, selected: select)
     
        ],
      ),
    );
  }

  
}


