import 'dart:convert';
import 'dart:io';
import 'package:cattel_feed/language/language.dart';
import 'package:cattel_feed/resource/const/colors.dart';
import 'package:cattel_feed/resource/const/icon.dart';
import 'package:cattel_feed/resource/const/textstyle.dart';
import 'package:cattel_feed/backend/apis.dart';
import 'package:cattel_feed/model/user_model/user_model.dart';
import 'package:cattel_feed/resource/component/appbar_component.dart';
import 'package:cattel_feed/resource/component/custom_text.dart';
import 'package:cattel_feed/resource/component/showloading.dart';
import 'package:cattel_feed/resource/sf/offline_storage.dart';
import 'package:cattel_feed/resource/utils/utils.dart';
import 'package:cattel_feed/view/account_setting/app_settings/edit_profile/image_picker.dart';
import 'package:cattel_feed/view/address/add_address/add_new_address.dart';
import 'package:cattel_feed/view_model/controller/logged_in_user_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:country_state_city/utils/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

List<String> dropCitys = [];
List<dynamic> dropStates = [];

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
  dynamic stateValue;
  String? cityValue;
  String selectgender = "Male";
  String image = "";
  bool loading = true;

  List<String> gender = [
    "Male",
    "Female",
    "Transgender",
  ];

  @override
  void initState() {
    setData();
    super.initState();
  }

  getStates() async {
    var data = await getStatesOfCountry("IN");
    dropStates = data;
    setState(() {});
  }

  Future getCities(String stateCode) async {
    dropCitys =
        (await getStateCities("IN", stateCode)).map((e) => e.name).toList();
    if (kDebugMode) {
      print(dropCitys.length);
    }
    cityValue = dropCitys.first;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppbar(LanguagesKey.userProfile.tr),
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
                                    Utils.flushBarErrorMessage(
                                        error.toString(), context);
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
              textfiledWithName(name, LanguagesKey.fullName.tr, "John Doe",
                  padding: false),
              20.h.heightBox,
              textfiledWithName(
                  number, LanguagesKey.phoneNumber.tr, "+91 *******123",
                  padding: false),
              20.h.heightBox,
              textfiledWithName(
                  email, LanguagesKey.email.tr, "johndoe@example.com",
                  padding: false),
              20.h.heightBox,
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                  LanguagesKey.gender.tr,
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
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          LanguagesKey.state.tr,
                          style: GetTextTheme.fs12_regular,
                        ),
                        DropdownButtonFormField(
                          isExpanded: true,
                          value: stateValue,
                          hint: const Text("Select State"),
                          style: GetTextTheme.fs16_regular,
                          decoration: const InputDecoration(
                              focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.black54)),
                              border: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.black87))),
                          icon: const Icon(Icons.keyboard_arrow_down),
                          items: dropStates
                              .map((e) => DropdownMenuItem(
                                  value: e,
                                  child: Text(e.name,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: GetTextTheme.fs16_regular
                                          .copyWith(color: Colors.black54))))
                              .toList(),
                          onChanged: (dynamic value) async {
                            stateValue = value;

                            setState(() {
                              loading = true;
                            });
                            await getCities(value.isoCode);
                            setState(() {
                              loading = false;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  20.w.widthBox,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          LanguagesKey.city.tr,
                          style: GetTextTheme.fs12_regular,
                        ),
                        DropdownButtonFormField(
                          isExpanded: true,
                          value: cityValue,
                          hint: const Text("Select City"),
                          style: GetTextTheme.fs16_regular,
                          decoration: const InputDecoration(
                              focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.black54)),
                              border: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.black87))),
                          // icon: const Icon(Icons.keyboard_arrow_down),
                          items: dropCitys.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: GetTextTheme.fs16_regular
                                      .copyWith(color: Colors.black54)),
                            );
                          }).toList(),
                          onChanged: (value) {
                            cityValue = value.toString();
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
              20.h.heightBox,
              textfiledWithName(
                  bio, LanguagesKey.bio.tr, "Hey, I am a Musician.",
                  padding: false),
              25.h.heightBox,
              customButtonWithGradent(LanguagesKey.editprofile.tr, () async {
                setState(() {
                  loading = true;
                });
                var controller = Get.find<LoggedInUserController>();
                UserModel user = controller.userModel!;

                if (profilePicture != null) {
                  image = await FirebaseApis.uploadImageOnFirebase(
                      profilePicture!, "customers/profile/${user.uid}");
                }
                user.name = name.text;
                user.phone = number.text;
                user.email = email.text;
                user.bio = bio.text;
                user.image = image;
                user.gender = selectgender;
                if (cityValue.isNotEmptyAndNotNull) {
                  user.state = stateValue.name;
                  user.city = cityValue!;
                }

                await FirebaseFirestore.instance
                    .collection("customers")
                    .doc(user.uid)
                    .update(user.toJson());
                await SFStorage.setSFData(
                    SFStorage.savedUser, jsonEncode(user.toJson()));
                setState(() {
                  loading = false;
                });
              }),
              25.h.heightBox,
            ],
          ),
          loading ? const ShowLoading() : const SizedBox()
        ],
      ),
    );
  }

  setData() async {
    await getStates();
    var controller = Get.find<LoggedInUserController>();
    name.text = controller.userModel!.name;
    number.text = controller.userModel!.phone;
    email.text = controller.userModel!.email;
    bio.text = controller.userModel!.bio;
    image = controller.userModel!.image;

    String state = controller.userModel!.state.toString();

    if (state.isNotEmptyAndNotNull) {
      stateValue = dropStates.firstWhere((element) => element.name == state);
      await getCities(stateValue.isoCode);
      String city = controller.userModel!.city.toString();
      cityValue = city;
    }

    selectgender = controller.userModel!.gender.isEmptyOrNull
        ? "Male"
        : controller.userModel!.gender;

    setState(() {
      loading = false;
    });
  }
}
