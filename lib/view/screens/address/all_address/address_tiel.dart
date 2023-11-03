// ignore_for_file: must_be_immutable

import 'dart:convert';

import 'package:cattel_feed/Helper/colors.dart';
import 'package:cattel_feed/Helper/textstyle.dart';
import 'package:cattel_feed/backend/dummyData.dart';

import 'package:cattel_feed/controller/addressController/addressController.dart';
import 'package:cattel_feed/model/addressModel.dart';
import 'package:cattel_feed/view/component/custom_text.dart';
import 'package:cattel_feed/view/component/icon_with_gradinet.dart';
import 'package:cattel_feed/view/screens/address/add_address/add_new_address.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class AddressTiel extends StatelessWidget {
  int index;

  AddressTiel({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    AddressModel address = AddressModel.fromJson(allAddressDummyData[index]);

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 3.h),
      padding: const EdgeInsets.all(10),
      color: Colors.green.withOpacity(.1),
      child: GetBuilder<AddressController>(
        builder: (controller) => Column(
          children: [
            Row(
              children: [
                customText(address.addresstitle, GetTextTheme.fs16_bold),
                10.widthBox,
                InkWell(
                    onTap: () => Get.to(() => AddNewAddressView(
                          isEdit: true,
                          data: jsonEncode(address),
                          index: index,
                        )),
                    child: customIconWithGradient(Icons.edit_outlined)),
                const Spacer(),
                Radio(
                  activeColor: AppColors.primaryColor,
                  value: address.addresstitle,
                  groupValue: controller.currentAddresstitle.addresstitle,
                  onChanged: (value) {
                    controller.updateAddress(address);
                  },
                ),
              ],
            ),
            customText(
                "Lorem ipsum dolor sit amet consectetur. Ornare pulvinar a porta egestas eu. Turpis integer ultricies lorem euismod malesuada in quis vitae nunc. Ut integer proin.",
                GetTextTheme.fs14_regular)
          ],
        ),
      ),
    );
  }
}
