import 'dart:convert';
import 'dart:io';
import 'package:cattel_feed/Helper/colors.dart';
import 'package:cattel_feed/Helper/show_snackbar.dart';
import 'package:cattel_feed/Helper/textstyle.dart';
import 'package:cattel_feed/backend/apis.dart';
import 'package:cattel_feed/controller/loading_Controller/loading_controller.dart';
import 'package:cattel_feed/global/global.dart';
import 'package:cattel_feed/helper/icon.dart';
import 'package:cattel_feed/model/stateModel.dart';
import 'package:cattel_feed/view/component/appbar_component.dart';
import 'package:cattel_feed/view/component/custom_text.dart';
import 'package:cattel_feed/view/component/showloading.dart';
import 'package:cattel_feed/view/screens/account_setting/app_settings/edit_profile/image_picker.dart';
import 'package:cattel_feed/view/screens/address/add_address/add_new_address.dart';
import 'package:cattel_feed/view/sf/offline_storage.dart';
import 'package:country_state_city/models/city.dart';
import 'package:country_state_city/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

List<City> dropCitys = [];
List<StateModel> dropStates = [];

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
  StateModel? stateValue;
  City? cityValue;
  String selectgender = "Male";
  String image = "";

  List<String> gender = [
    "Male",
    "Female",
    "Transgender",
  ];

  @override
  void initState() {
    setData();
    getStates();
    super.initState();
  }

  getStates() async {
    var states = await getStatesOfCountry("IN");
    dropStates = states
        .map((e) => StateModel(
            name: e.name, countryCode: e.countryCode, isoCode: e.isoCode))
        .toList();
    stateValue = dropStates.first;
  }

  getCities(String stateCode) async {
    dropCitys = await getStateCities("IN", stateCode);
    cityValue = dropCitys.first;
  }

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(LoadingController());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppbar("User Profile"),
      body: Stack(
        children: [
          ListView(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            children: [
              20.h.heightBox,
              Center(
                child: Stack(
                  children: [
                    SizedBox(
                      height: 110.h,
                      width: 110.w,
                      child: profilePicture == null
                          ? image.isEmpty
                              ? CircleAvatar(
                                  backgroundImage:
                                      AssetImage(IconsClass.personIcon),
                                )
                              : CircleAvatar(
                                  backgroundImage: NetworkImage(image),
                                )
                          : CircleAvatar(
                              backgroundImage: FileImage(profilePicture!),
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
                                    setState(() {});
                                  }).onError((error, stackTrace) {
                                    showSnackbar(context, error.toString());
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
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                  "Gender",
                  style: GetTextTheme.fs12_regular,
                ),
                DropdownButtonFormField(
                  value: selectgender,
                  style: GetTextTheme.fs16_regular,
                  decoration: const InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black54)),
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black87))),
                  icon: const Icon(Icons.keyboard_arrow_down),
                  items: gender.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items,
                          style: GetTextTheme.fs16_regular
                              .copyWith(color: Colors.black54)),
                    );
                  }).toList(),
                  onChanged: (value) {
                    selectgender = value.toString();
                  },
                ),
              ]),
              20.h.heightBox,
              // Row(
              //   children: [
              //     Expanded(
              //         child: Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         Text(
              //           "State",
              //           style: GetTextTheme.fs12_regular,
              //         ),
              //         DropdownButton(
              //           hint: const Text("Select State"),
              //           style: GetTextTheme.fs16_regular,
              //           items: dropStates.map((items) {
              //             return DropdownMenuItem(
              //               value: items,
              //               child: Text(items.name,
              //                   maxLines: 1,
              //                   overflow: TextOverflow.ellipsis,
              //                   style: GetTextTheme.fs16_regular
              //                       .copyWith(color: Colors.black54)),
              //             );
              //           }).toList(),
              //           onChanged: (value) async {
              //             stateValue = value;

              //             dropCitys = getCities(value!.isoCode);
              //             cityValue = dropCitys.first;
              //             print("check now");
              //             setState(() {});
              //           },
              //         ),
              //       ],
              //     )),
              //     30.w.widthBox,
              //     Expanded(
              //         child: Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         Text(
              //           "City",
              //           style: GetTextTheme.fs12_regular,
              //         ),
              //         DropdownButtonFormField(
              //           hint: const Text("Select City"),
              //           style: GetTextTheme.fs16_regular,
              //           decoration: const InputDecoration(
              //               focusedBorder: UnderlineInputBorder(
              //                   borderSide: BorderSide(color: Colors.black54)),
              //               border: UnderlineInputBorder(
              //                   borderSide: BorderSide(color: Colors.black87))),
              //           items: dropCitys.map((items) {
              //             return DropdownMenuItem(
              //               value: items,
              //               child: Text(items.name,
              //                   maxLines: 1,
              //                   overflow: TextOverflow.ellipsis,
              //                   style: GetTextTheme.fs16_regular
              //                       .copyWith(color: Colors.black54)),
              //             );
              //           }).toList(),
              //           onChanged: (value) async {
              //             cityValue = value;
              //             setState(() {});
              //           },
              //         ),
              //       ],
              //     )),
              //   ],
              // ),
              // 20.h.heightBox,
              textfiledWithName(bio, "Bio", "Hey, I am a Musician.",
                  padding: false),
              25.h.heightBox,
              customButtonWithGradent("Edit Profile", () async {
                controller.updateLoadingState();
                if (profilePicture != null) {
                  image = await FirebaseApis.uploadImageOnFirebase(
                      profilePicture!, "customers/${loggedInUserInfo!.uid}");
                }
                loggedInUserInfo!.name = name.text;
                loggedInUserInfo!.phone = number.text;
                loggedInUserInfo!.email = email.text;
                loggedInUserInfo!.bio = bio.text;
                loggedInUserInfo!.image = image;
                loggedInUserInfo!.gender = selectgender;
                await FirebaseApis.updateuserDetails(loggedInUserInfo!);
                await setSFData(
                    "loggedInUser", jsonEncode(loggedInUserInfo!.toJson()));

                controller.updateLoadingState();
              })
            ],
          ),
          const ShowLoading()
        ],
      ),
    );
  }

  setData() async {
    name.text = loggedInUserInfo!.name;
    number.text = loggedInUserInfo!.phone;
    email.text = loggedInUserInfo!.email;
    bio.text = loggedInUserInfo!.bio;
    image = loggedInUserInfo!.image;

    selectgender = loggedInUserInfo!.gender.isEmptyOrNull
        ? "Male"
        : loggedInUserInfo!.gender;
    dropCitys.clear();
  }
}
