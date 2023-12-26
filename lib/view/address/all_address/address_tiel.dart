// ignore_for_file: must_be_immutable

import 'package:cattel_feed/resource/const/colors.dart';
import 'package:cattel_feed/resource/const/textstyle.dart';
import 'package:cattel_feed/model/address_model/addressModel.dart';
import 'package:cattel_feed/resource/component/custom_text.dart';
import 'package:cattel_feed/resource/component/icon_with_gradinet.dart';
import 'package:cattel_feed/view/address/add_address/add_new_address.dart';
import 'package:cattel_feed/view_model/controller/address_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class AddressTiel extends StatelessWidget {
  int index;

  AddressTiel({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserAddressController>(builder: (controller) {
      AddressModel address = controller.addresses[index];
      return InkWell(
        onTap: () {
          Get.to(AddNewAddressView(
            isEdit: true,
            index: index,
            address: controller.addresses[index],
          ));
        },
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 3.h),
          padding: const EdgeInsets.all(10),
          color: Colors.green.withOpacity(.1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  customText(address.addresstitle, GetTextTheme.fs16_bold),
                  10.widthBox,
                  customIconWithGradient(Icons.edit_outlined),
                  const Spacer(),
                  Radio(
                    activeColor: AppColors.primaryColor,
                    value: index,
                    groupValue: controller.selectIndex,
                    onChanged: (value) {
                      controller.updateIndex(index);
                    },
                  ),
                ],
              ),
              customText(
                  "${address.houseno} ${address.colony}, ${address.landmark}, ${address.city}, ${address.state} ",
                  GetTextTheme.fs14_regular)
            ],
          ),
        ),
      );
    });
  }
}
