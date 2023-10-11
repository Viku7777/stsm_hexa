import 'package:cattel_feed/Helper/showdialog.dart';
import 'package:cattel_feed/Helper/textstyle.dart';
import 'package:cattel_feed/const/colors.dart';
import 'package:cattel_feed/screens/component/appbar_component.dart';
import 'package:cattel_feed/screens/component/custom_text.dart';
import 'package:cattel_feed/screens/component/icon_with_gradinet.dart';
import 'package:cattel_feed/screens/component/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:velocity_x/velocity_x.dart';

class AddNewAddressView extends StatefulWidget {
  const AddNewAddressView({super.key});

  @override
  State<AddNewAddressView> createState() => _AddNewAddressViewState();
}

class _AddNewAddressViewState extends State<AddNewAddressView> {
  @override
  Widget build(BuildContext context) {
    var housenoController = TextEditingController();
    var roadAreaColonyController = TextEditingController();
    var landmarkController = TextEditingController();
    var pincodeController = TextEditingController();
    var cityController = TextEditingController();
    var stateController = TextEditingController();
    var addressTitleController = TextEditingController();
    var contactnameController = TextEditingController();
    var contactnocontroller = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppbar("Add new address", isActionButtonShow: false),
      body: ListView(
        children: [
          Container(
            color: Colors.grey.shade300,
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Address", style: GetTextTheme.fs16_bold),
                ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent),
                    onPressed: () {},
                    icon: customIconWithGradient(Icons.location_on_outlined),
                    label: customText(
                        "Use my current location",
                        GetTextTheme.fs16_regular
                            .copyWith(color: AppColors.redColor))),
              ],
            ),
          ),
          20.h.heightBox,
          adressTextfileWithTitle(housenoController,
              "House No. / Building Name", "Enter House No."),
          20.h.heightBox,
          adressTextfileWithTitle(roadAreaColonyController, "Road / Area / Colony",
              "Enter your area name"),
          20.h.heightBox,
          adressTextfileWithTitle(landmarkController, "Landmark / Nearby Place",
              "Famous place / Shop / School / Temple etc."),
          20.h.heightBox,
          adressTextfileWithTitle(pincodeController, "Pincode", "123456"),
          20.h.heightBox,
          Row(
            children: [
              Expanded(
                child:
                    adressTextfileWithTitle(cityController, "City", "Hisar"),
              ),
              10.w.widthBox,
              Expanded(
                child: adressTextfileWithTitle(
                    stateController, "State", "Haryana"),
              ),
            ],
          ),
          20.h.heightBox,
          Container(
            color: Colors.grey.shade300,
            padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 10.w),
            child: Text(
              "Contact Details",
              style: GetTextTheme.fs16_bold,
            ),
          ),
          20.h.heightBox,
          adressTextfileWithTitle(addressTitleController, "Address Title", ""),
          20.h.heightBox,
          Row(
            children: [
              Expanded(
                child: adressTextfileWithTitle(
                    contactnameController, "Contact Name", ""),
              ),
              10.w.widthBox,
              Expanded(
                child: adressTextfileWithTitle(
                    contactnocontroller, "Contact Number", "+91"),
              ),
            ],
          ),
          50.h.heightBox,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: customButtonWithGradent("Save Address", () => showDialog(context: context, builder: (context) =>showSuccessDialog("Address  Saved", 
            "A new address is successfully added to your address collection.", [
              10.heightBox,
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: Size.fromHeight(35.h),
                    backgroundColor: AppColors.greenColor),
                onPressed: () {},
               
                child:
                    Text("Done", style: GetTextTheme.fs16_regular.copyWith(color: Colors.white))),
                                  10.heightBox,
            ]))),
          ),
          50.h.heightBox,
        ],
      ),
    );
  }
}

Widget adressTextfileWithTitle(
  TextEditingController controller,
  title,
  hint,
) =>
    Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GetTextTheme.fs12_regular,
          ),
          CustomTextfield(
            controller: controller,
            hintText: hint,
            hintStyle:
                GetTextTheme.fs16_regular.copyWith(color: Colors.grey.shade500),
            border: const UnderlineInputBorder(),
          ),
        ],
      ),
    );
