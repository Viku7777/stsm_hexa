import 'dart:io';
import 'package:cattel_feed/Helper/textstyle.dart';
import 'package:cattel_feed/backend/dummyData.dart';
import 'package:cattel_feed/const/colors.dart';
import 'package:cattel_feed/screens/component/appbar_component.dart';
import 'package:cattel_feed/screens/component/custom_text.dart';
import 'package:cattel_feed/screens/ui/account_setting/app_settings/edit_profile/image_picker.dart';
import 'package:cattel_feed/screens/ui/address/add_address/add_new_address.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class UserProfileSettingView extends StatefulWidget {
  static String routes = "/account_&_settings/app_setting/profile_setting";
  const UserProfileSettingView({super.key});

  @override
  State<UserProfileSettingView> createState() => _UserProfileSettingViewState();
}

class _UserProfileSettingViewState extends State<UserProfileSettingView> {
  File? profilePicture;
  var name = TextEditingController();
  var number = TextEditingController();
  var email = TextEditingController();
  var bio = TextEditingController();
  String? stateValue = "";
  String? cityValue = "";
  String? countryValue = "";
  String selectgender = "Male";
  List<String> gender=[
    "Male" ,"Female", "Transgender",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar("User Profile"),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        children: [
          20.h.heightBox,
          Center(
            child: Stack(
              children: [
                Container(
                  height: 110.h,
                  width: 110.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(dummyitems[2]["image"]),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                    bottom: 5.h,
                    right: 0,
                    child: CircleAvatar(
                        backgroundColor: AppColors.primaryColor,
                        maxRadius: 12.sp,
                        child: IconButton(
                            onPressed: () async {
                              await imagePicker().then((value) {
                                profilePicture = File(value!.path);
                              }).onError((error, stackTrace) {
                                Get.snackbar("Error", error.toString(),
                                    backgroundColor: Colors.red);
                                return null;
                              });
                            },
                            icon: Icon(
                              Icons.edit,
                              color: Vx.white,
                              size: 10.sp,
                            ))))
              ],
            ),
          ),
          20.h.heightBox,
          textfiledWithName(name, "Full Name", "John Doe", padding: false),
          20.h.heightBox,
          textfiledWithName(number, "Phone Number", "+91 *******123",
              padding: false),
          20.h.heightBox,
          textfiledWithName(email, "Email ID", "johndoe@example.com",
              padding: false),
                        20.h.heightBox,
              Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Gender",
            style: GetTextTheme.fs12_regular,
          ),
            DropdownButtonFormField(
                value: selectgender,
                style: GetTextTheme.fs16_regular,
                decoration:  const InputDecoration(enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                disabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black26)),
                focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black26)),
                border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black26))),
               icon: const Icon(Icons.keyboard_arrow_down),     
                items: gender.map((String items) { 
                return DropdownMenuItem( 
                  value: items,
                  child: Text(items,style: GetTextTheme.fs16_regular,), 
                ); 
              }).toList() , onChanged: (value) {
                setState(() {
                  selectgender=value.toString();
                });
              },),
    
          ]
              ),
            
          20.h.heightBox,
          textfiledWithName(bio, "Bio", "Hey, I am a Musician.",
              padding: false),
          25.h.heightBox,
          customButtonWithGradent("Edit Profile", () => null)
        ],
      ),
    );
  }
}
