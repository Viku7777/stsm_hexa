// ignore_for_file: must_be_immutable, use_build_context_synchronously

import 'package:cattel_feed/resource/const/colors.dart';
import 'package:cattel_feed/resource/const/icon.dart';
import 'package:cattel_feed/resource/const/textstyle.dart';
import 'package:cattel_feed/model/address_model/addressModel.dart';
import 'package:cattel_feed/resource/component/appbar_component.dart';
import 'package:cattel_feed/resource/component/custom_text.dart';
import 'package:cattel_feed/resource/component/icon_with_gradinet.dart';
import 'package:cattel_feed/resource/utils/utils.dart';
import 'package:cattel_feed/view/address/apis.dart';
import 'package:cattel_feed/view_model/controller/address_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_geocoder/geocoder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:velocity_x/velocity_x.dart';

class AddNewAddressView extends StatefulWidget {
  static String routes = "/add_address";
  bool isEdit;
  AddressModel? address;
  int index;

  AddNewAddressView(
      {super.key, this.isEdit = false, this.address, this.index = 0});

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
  String latitude = "";
  String longitude = "";

  @override
  void initState() {
    if (widget.isEdit) {
      initData();
    }
    super.initState();
  }

  initData() {
    AddressModel data = widget.address!;
    housenoController.text = data.houseno;
    roadAreaColonyController.text = data.colony;
    landmarkController.text = data.landmark;
    pincodeController.text = data.pincode.toString();
    cityController.text = data.city;
    stateController.text = data.state;
    addressTitleController.text = data.addresstitle;
    contactnameController.text = data.name;
    contactnocontroller.text = data.number;
    latitude = data.lat ?? "";
    longitude = data.lng ?? "";
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
              height: 40.h,
              color: Colors.grey.shade300,
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Address", style: GetTextTheme.fs16_bold),
                  InkWell(
                    onTap: () async {
                      PermissionStatus status =
                          await AddressApis.requestPermission(
                              Permission.location);
                      if (status.isDenied || status.isPermanentlyDenied) {
                        Utils.flushBarErrorMessage(
                            "Please allow location permission", context);
                      } else {
                        fatchLocation();
                      }
                    },
                    child: Row(
                      children: [
                        customIconWithGradient(Icons.location_on_outlined),
                        customText(
                            "Use my current location",
                            GetTextTheme.fs16_regular
                                .copyWith(color: AppColors.primaryColor))
                      ],
                    ),
                  )
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
              child: customButtonWithGradent("Save Address", () async {
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
                    int.parse(pincodeController.text),
                  );
                  address.lat = latitude;
                  address.lng = longitude;
                  var controller = Get.find<UserAddressController>();
                  if (widget.isEdit) {
                    Utils.flushBarErrorMessage(
                        "functionality pending", context);
                  } else {
                    controller.addnewAddress(address, context);
                  }
                }
              }),
            ),
            50.h.heightBox,
          ],
        ),
      ),
    );
  }

  fatchLocation() async {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(IconsClass.locationFatchIcon,
                  height: 200.h, width: 200.w),
              5.h.heightBox,
              customtextWithGradentColor(
                  "Fetching location", GetTextTheme.fs28_bold),
              5.h.heightBox,
              Text(
                "Please wait while we are getting your \ncurrent location.",
                textAlign: TextAlign.center,
                style: GetTextTheme.fs14_regular,
              ),
              10.h.heightBox,
              CircularProgressIndicator(
                color: AppColors.primaryColor,
              ),
            ],
          ),
        );
      },
    );
    Coordinates currentlatlng = await AddressApis.userCurrentLatLng();
    Address address = await AddressApis.latlngConvertIntoAddress(
        Coordinates(currentlatlng.latitude, currentlatlng.longitude));
    housenoController.text = address.featureName ?? "";
    roadAreaColonyController.text = address.subLocality ?? "";
    landmarkController.text = address.thoroughfare ?? "";
    pincodeController.text = address.postalCode ?? "";
    cityController.text = address.locality ?? "";
    stateController.text = address.adminArea ?? '';
    latitude = address.coordinates.latitude.toString();
    longitude = address.coordinates.longitude.toString();

    Navigator.pop(context);
    setState(() {});
  }
}

Widget textfiledWithName(TextEditingController controller, title, hint,
        {bool padding = true,
        String? Function(String?)? validator,
        TextInputType? keyboardType,
        Widget? suffix}) =>
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
              suffixIcon: suffix,
              suffixIconColor: Colors.black,
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
