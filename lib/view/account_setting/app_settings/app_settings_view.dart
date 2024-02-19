// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:cattel_feed/language/language.dart';
import 'package:cattel_feed/resource/const/nextscreen.dart';
import 'package:cattel_feed/resource/const/textstyle.dart';
import 'package:cattel_feed/resource/component/appbar_component.dart';
import 'package:cattel_feed/resource/component/icon_with_gradinet.dart';
import 'package:cattel_feed/view/account_setting/app_settings/edit_profile/user_profile_setting.dart';
import 'package:cattel_feed/view/account_setting/app_settings/language/language_setting_view.dart';
import 'package:cattel_feed/view/account_setting/app_settings/notification_settings/notification_settings_view.dart';
import 'package:cattel_feed/view/auth/screens/loginwithNumber.dart';
import 'package:cattel_feed/resource/sf/offline_storage.dart';
import 'package:cattel_feed/view_model/controller/cart_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppSettingView extends StatefulWidget {
  static String routes = "/account_&_settings/app_setting";
  const AppSettingView({super.key});

  @override
  State<AppSettingView> createState() => _AppSettingViewState();
}

class _AppSettingViewState extends State<AppSettingView> {
  List screens = [
    {
      "name": LanguagesKey.editprofile.tr,
      "icon": Icons.person_outlined,
      "route": UserProfileSettingView.routes,
    },
    {
      "name": LanguagesKey.language.tr,
      "icon": Icons.translate_sharp,
      "route": ChangeLanguageView.routes,
    },
    {
      "name": LanguagesKey.notifications.tr,
      "icon": Icons.notifications_none_outlined,
      "route": NotificationSettingView.routes,
    },
    {"name": LanguagesKey.logout.tr, "icon": Icons.login}
  ];
  @override
  void initState() {
    // getData();
    super.initState();
  }

  // getData() async {
  //   dropStates.clear();
  //   var states = await getStatesOfCountry('IN');
  //   dropStates = states;
  // }

  @override
  Widget build(BuildContext context) {
    print("language change");
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppbar(LanguagesKey.appSettings.tr),
      body: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: screens.length,
        separatorBuilder: (context, index) => const Divider(thickness: 1.5),
        itemBuilder: (context, index) => ListTile(
          onTap: () async {
            if (screens[index]["name"] == "Logout") {
              Get.find<NewCartController>().updateCartItems([]);
              var sf = await SharedPreferences.getInstance();
              await sf.setString(SFStorage.savedUser, "");
              await sf.setString("userAllAddresses", "");
              await FirebaseAuth.instance.signOut();

              Get.offAllNamed(LoginWithNumber.routes);
            } else {
              nextscreen(context, screens[index]["route"]);
            }
          },
          leading: customIconWithGradient(screens[index]["icon"]),
          title: Text(
            screens[index]["name"],
            style: GetTextTheme.fs16_regular,
          ),
        ),
      ),
    );
  }
}
