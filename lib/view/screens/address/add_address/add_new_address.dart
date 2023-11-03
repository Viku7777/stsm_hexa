// ignore_for_file: must_be_immutable

import 'dart:convert';

import 'package:cattel_feed/Helper/colors.dart';
import 'package:cattel_feed/Helper/nextscreen.dart';
import 'package:cattel_feed/Helper/showdialog.dart';
import 'package:cattel_feed/Helper/textstyle.dart';
import 'package:cattel_feed/backend/dummyData.dart';
import 'package:cattel_feed/model/addressModel.dart';
import 'package:cattel_feed/view/component/appbar_component.dart';
import 'package:cattel_feed/view/component/custom_text.dart';
import 'package:cattel_feed/view/component/icon_with_gradinet.dart';
import 'package:cattel_feed/view/screens/bottomNav/bottom_Nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

class AddNewAddressView extends StatefulWidget {
  static String routes = "/add_address";
  bool isEdit;
  String data;
  int index;

  AddNewAddressView(
      {super.key, this.isEdit = false, this.data = "", this.index = 0});

  @override
  State<AddNewAddressView> createState() => _AddNewAddressViewState();
}

class _AddNewAddressViewState extends State<AddNewAddressView> {
  var formKey = GlobalKey<FormState>();
  var housenoController = TextEditingController();
  var roadAreaColonyController = TextEditingController();
  var landmarkController = TextEditingController();
  var pincodeController = TextEditingController();
  var cityController = TextEditingController();
  var stateController = TextEditingController();
  var addressTitleController = TextEditingController();
  var contactnameController = TextEditingController();
  var contactnocontroller = TextEditingController();
  @override
  void initState() {
    if (widget.isEdit) {
      initData();
    }
    super.initState();
  }

  initData() {
    AddressModel data = AddressModel.fromJson(jsonDecode(widget.data));
    housenoController.text = data.houseno;
    roadAreaColonyController.text = data.colony;
    landmarkController.text = data.landmark;
    pincodeController.text = data.pincode.toString();
    cityController.text = data.city;
    stateController.text = data.state;
    addressTitleController.text = data.addresstitle;
    contactnameController.text = data.name;
    contactnocontroller.text = data.number;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppbar("Add new address", isActionButtonShow: false),
      body: Form(
        key: formKey,
        child: ListView(
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
                              .copyWith(color: AppColors.primaryColor))),
                ],
              ),
            ),
            20.h.heightBox,
            textfiledWithName(
              housenoController,
              "House No. / Building Name",
              "Enter House No.",
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please fill your building or house no";
                } else {
                  return null;
                }
              },
            ),
            20.h.heightBox,
            textfiledWithName(
              roadAreaColonyController,
              "Road / Area / Colony",
              "Enter your area name",
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please fill your area name";
                }
                return null;
              },
            ),
            20.h.heightBox,
            textfiledWithName(
              landmarkController,
              "Landmark / Nearby Place",
              "Famous place / Shop / School / Temple etc.",
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please fill your landmark";
                }
                return null;
              },
            ),
            20.h.heightBox,
            textfiledWithName(
              pincodeController,
              "Pincode",
              "123456",
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please fill your pincode";
                }
                return null;
              },
            ),
            20.h.heightBox,
            Row(
              children: [
                Expanded(
                  child: textfiledWithName(
                    cityController,
                    "City",
                    "Hisar",
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please fill your city name";
                      }
                      return null;
                    },
                  ),
                ),
                10.w.widthBox,
                Expanded(
                  child: textfiledWithName(
                    stateController,
                    "State",
                    "Haryana",
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please fill your state name";
                      }
                      return null;
                    },
                  ),
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
            textfiledWithName(
              addressTitleController,
              "Address Title",
              "",
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please fill address title";
                }
                return null;
              },
            ),
            20.h.heightBox,
            Row(
              children: [
                Expanded(
                  child: textfiledWithName(
                    contactnameController,
                    "Contact Name",
                    "",
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please fill contact name";
                      }
                      return null;
                    },
                  ),
                ),
                10.w.widthBox,
                Expanded(
                  child: textfiledWithName(
                    contactnocontroller,
                    "Contact Number",
                    "+91",
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please fill contact number";
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
            50.h.heightBox,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: customButtonWithGradent("Save Address", () {
                if (formKey.currentState!.validate()) {
                  var address = AddressModel(
                      housenoController.text,
                      roadAreaColonyController.text,
                      landmarkController.text,
                      cityController.text,
                      stateController.text,
                      addressTitleController.text,
                      contactnameController.text,
                      contactnocontroller.text,
                      int.parse(pincodeController.text));
                  if (widget.isEdit) {
                    allAddressDummyData[widget.index] = address.toJson();
                  } else {
                    allAddressDummyData.add(address.toJson());
                  }
                  showDialog(
                      context: context,
                      builder: (context) => showSuccessDialog(
                              "Address  Saved",
                              "A new address is successfully added to your address collection.",
                              [
                                10.heightBox,
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        minimumSize: Size.fromHeight(35.h),
                                        backgroundColor: AppColors.greenColor),
                                    onPressed: () {
                                      nextscreenRemove(
                                          context, BottomNavView.routes);
                                    },
                                    child: Text("Done",
                                        style: GetTextTheme.fs16_regular
                                            .copyWith(color: Colors.white))),
                                10.heightBox,
                              ]));
                }
              }),
            ),
            50.h.heightBox,
          ],
        ),
      ),
    );
  }
}

Widget textfiledWithName(TextEditingController controller, title, hint,
        {bool padding = true,
        String? Function(String?)? validator,
        TextInputType? keyboardType}) =>
    Container(
      padding: EdgeInsets.symmetric(horizontal: padding ? 12.w : 0),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GetTextTheme.fs12_regular,
          ),
          TextFormField(
            controller: controller,
            validator: validator,
            keyboardType: keyboardType,
            cursorColor: AppColors.primaryColor,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(top: 5.h),
              focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black)),
              enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black)),
              hintText: hint,
              hintStyle: GetTextTheme.fs16_regular
                  .copyWith(color: Colors.grey.shade500),
            ),
          ),
        ],
      ),
    );
