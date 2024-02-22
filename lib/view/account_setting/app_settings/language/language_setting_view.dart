// ignore_for_file: avoid_print

import 'package:cattel_feed/language/language.dart';
import 'package:cattel_feed/resource/const/colors.dart';
import 'package:cattel_feed/resource/const/textstyle.dart';

import 'package:cattel_feed/resource/component/appbar_component.dart';
import 'package:cattel_feed/resource/component/custom_text.dart';
import 'package:cattel_feed/resource/sf/offline_storage.dart';
import 'package:cattel_feed/view/bottomNav/bottom_Nav.dart';
import 'package:cattel_feed/view/homepage/home_view/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:velocity_x/velocity_x.dart';

class ChangeLanguageView extends StatefulWidget {
  static String routes = "/account_&_settings/app_setting/change_language";

  const ChangeLanguageView({super.key});

  @override
  State<ChangeLanguageView> createState() => _ChangeLanguageViewState();
}

class _ChangeLanguageViewState extends State<ChangeLanguageView> {
  List language = [
    "हिंदी",
    "English",
  ];
  String selectValue = "English";
  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppbar(LanguagesKey.language.tr),
        body: Padding(
          padding: EdgeInsets.all(10.sp),
          child: Column(
            children: [
              customListview(
                isverticalAxis: true,
                language.length,
                (index) => Column(children: [
                  const Divider(
                    color: Colors.grey,
                  ),
                  RadioListTile.adaptive(
                    controlAffinity: ListTileControlAffinity.trailing,
                    activeColor: AppColors.primaryColor,
                    title:
                        customText(language[index], GetTextTheme.fs16_regular),
                    value: language[index],
                    groupValue: selectValue,
                    onChanged: (value) {
                      selectValue = value.toString();
                      setState(() {});
                    },
                  ),
                ]),
              ),
              const Divider(
                color: Colors.grey,
              ),
              20.h.heightBox,
              customButtonWithGradent("Save", () async {
                var sf = await SharedPreferences.getInstance();

                if (selectValue == language[0]) {
                  Get.updateLocale(const Locale("hi", "IN"));
                  await sf.setString("deviceLanguageCode", "hi");
                  await sf.setString("deviceLanguageCountry", "IN");
                } else {
                  Get.updateLocale(const Locale("en", "US"));
                  await sf.setString("deviceLanguageCode", "en");
                  await sf.setString("deviceLanguageCountry", "US");
                }
                await Get.offAllNamed(BottomNavView.routes);
              })
            ],
          ),
        ));
  }

  getData() async {
    String? languagecode = await SFStorage.getSFData("deviceLanguageCode");
    String? countryCode = await SFStorage.getSFData("deviceLanguageCountry");
    if (languagecode.isNotEmptyAndNotNull || countryCode.isNotEmptyAndNotNull) {
      if (languagecode == "hi") {
        selectValue = language[0];
      } else {
        selectValue = language[1];
      }
      setState(() {});
    }
  }
}
