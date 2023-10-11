import 'package:cattel_feed/Helper/textstyle.dart';
import 'package:cattel_feed/const/colors.dart';
import 'package:cattel_feed/screens/component/appbar_component.dart';
import 'package:cattel_feed/screens/ui/address/add_address/add_new_address.dart';
import 'package:cattel_feed/screens/ui/address/all_address/address_tiel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';

class AddAddressView extends StatefulWidget {
  const AddAddressView({super.key});

  @override
  State<AddAddressView> createState() => _AddAddressViewState();
}

class _AddAddressViewState extends State<AddAddressView> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppbar("Add / Edit Delivery Address",isActionButtonShow: false),
      body: ListView(
        children: [
         Divider(color: Colors.grey.shade200,thickness: 1.5),
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            height: 30.h,
            child: InkWell(
              onTap: () => Get.to(()=>const AddNewAddressView()),
              child: Text("+ Add new address",style:GetTextTheme.fs16_regular.copyWith(color: AppColors.redColor),))),
         Divider(color: Colors.grey.shade200,thickness: 1.5),
            Expanded(child: ListView.builder(
              itemCount: 2,
              shrinkWrap: true,
              itemBuilder: (context, index) => const AddressTiel(),))


        ],
      ),
   
   
    );
  }
}