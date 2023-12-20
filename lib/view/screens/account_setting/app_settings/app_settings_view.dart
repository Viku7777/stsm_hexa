// ignore_for_file: use_build_context_synchronously

import 'package:cattel_feed/Helper/nextscreen.dart';
import 'package:cattel_feed/Helper/textstyle.dart';
import 'package:cattel_feed/model/stateModel.dart';
import 'package:cattel_feed/resource/component/appbar_component.dart';
import 'package:cattel_feed/resource/component/icon_with_gradinet.dart';
import 'package:cattel_feed/view/screens/account_setting/app_settings/edit_profile/user_profile_setting.dart';
import 'package:cattel_feed/view/screens/account_setting/app_settings/language/language_setting_view.dart';
import 'package:cattel_feed/view/screens/account_setting/app_settings/notification_settings/notification_settings_view.dart';
import 'package:cattel_feed/view/auth/screens/loginwithNumber.dart';
import 'package:cattel_feed/resource/sf/offline_storage.dart';
import 'package:country_state_city/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AppSettingView extends StatefulWidget {
  static String routes = "/account_&_settings/app_setting";
  const AppSettingView({super.key});

  @override
  State<AppSettingView> createState() => _AppSettingViewState();
}

class _AppSettingViewState extends State<AppSettingView> {
  List screens = [
    {
      "name": "Edit Profile",
      "icon": Icons.person_outlined,
      "route": UserProfileSettingView.routes,
    },
    {
      "name": "Language",
      "icon": Icons.translate_sharp,
      "route": ChangeLanguageView.routes,
    },
    {
      "name": "Notifications",
      "icon": Icons.notifications_none_outlined,
      "route": NotificationSettingView.routes,
    },
    {"name": "Logout", "icon": Icons.login}
  ];
  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    dropStates.clear();
    var states = await getStatesOfCountry('IN');
    dropStates = states.map((e) => StateModel.fromJson(e.toJson())).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppbar("App Settings"),
      body: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: screens.length,
        separatorBuilder: (context, index) => const Divider(thickness: 1.5),
        itemBuilder: (context, index) => ListTile(
          onTap: () async {
            if (screens[index]["name"] == "Logout") {
              FirebaseAuth.instance.signOut();
              SFStorage.setSFData(SFStorage.savedUser, "");
              nextscreenRemove(context, LoginWithNumber.routes);
              await setSFData("userAllAddresses", "");
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
