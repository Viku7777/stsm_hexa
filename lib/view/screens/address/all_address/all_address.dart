import 'package:cattel_feed/Helper/colors.dart';
import 'package:cattel_feed/Helper/nextscreen.dart';
import 'package:cattel_feed/Helper/textstyle.dart';
import 'package:cattel_feed/helper/icon.dart';
import 'package:cattel_feed/resource/component/appbar_component.dart';
import 'package:cattel_feed/resource/component/custom_text.dart';
import 'package:cattel_feed/view/screens/address/add_address/add_new_address.dart';
import 'package:cattel_feed/view/screens/address/all_address/address_tiel.dart';
import 'package:cattel_feed/view_model/controller/address_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_geocoder/geocoder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class AllAddressView extends StatefulWidget {
  static String routes = "/all_address";

  const AllAddressView({super.key});

  @override
  State<AllAddressView> createState() => _AllAddressViewState();
}

class _AllAddressViewState extends State<AllAddressView> {
  List<Address> allAddress = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppbar("Add / Edit Delivery Address",
          isActionButtonShow: false),
      body: ListView(
        children: [
          Divider(color: Colors.grey.shade200, thickness: 1.5),
          Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              height: 30.h,
              child: InkWell(
                  onTap: () => nextscreen(context, AddNewAddressView.routes),
                  child: Text(
                    "+ Add new address",
                    style: GetTextTheme.fs16_regular
                        .copyWith(color: AppColors.primaryColor),
                  ))),
          Divider(color: Colors.grey.shade200, thickness: 1.5),
          GetBuilder<UserAddressController>(
            builder: (controller) {
              if (controller.addresses.isEmpty) {
                return Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      50.h.heightBox,
                      Image.asset(IconsClass.addressIcon, width: 225.w),
                      customtextWithGradentColor(
                          "No Addresses Found!", GetTextTheme.fs28_bold),
                      Text(
                        "Seems like you have not added any address yet.\nPlease add your first address of delivery.",
                        style: GetTextTheme.fs14_regular,
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                );
              } else {
                return ListView.builder(
                    itemCount: controller.addresses.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) => AddressTiel(
                          index: index,
                        ));
              }
            },
          )
        ],
      ),
    );
  }
}
