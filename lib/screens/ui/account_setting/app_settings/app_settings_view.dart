import 'package:cattel_feed/Helper/nextscreen.dart';
import 'package:cattel_feed/Helper/textstyle.dart';
import 'package:cattel_feed/screens/component/appbar_component.dart';
import 'package:cattel_feed/screens/component/icon_with_gradinet.dart';
import 'package:cattel_feed/screens/ui/account_setting/app_settings/edit_profile/user_profile_setting.dart';
import 'package:cattel_feed/screens/ui/account_setting/app_settings/language/language_setting_view.dart';
import 'package:cattel_feed/screens/ui/account_setting/app_settings/notification_settings/notification_settings_view.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class AppSettingView extends StatefulWidget {
  static String routes = "/account_&_settings/app_setting"; 
  const AppSettingView({super.key});

  @override
  State<AppSettingView> createState() => _AppSettingViewState();
}

class _AppSettingViewState extends State<AppSettingView> {
List screens =[
  {"name":"Edit Profile",
  "icon" :Icons.person_outlined,
  "route": UserProfileSettingView.routes,
  },
    {"name":"Language",
  "icon" :Icons.translate_sharp,
  "route" : ChangeLanguageView.routes,
  },
    {"name":"Notifications",
  "icon" :Icons.notifications_none_outlined,
  "route":NotificationSettingView.routes,
  },
   {"name":"Dark Mode",
  "icon" :Icons.mode_night_outlined
  },
   {"name":"Logout",
  "icon" :Icons.login
  }
];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: customAppbar("App Settings"),
      body:  ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: screens.length,
                separatorBuilder: (context, index) =>
                    const Divider(thickness: 1.5),
                itemBuilder: (context, index) => ListTile(
                onTap: () =>index<=2?  nextscreen(context, screens[index]["route"]): null,
                  leading: customIconWithGradient(screens[index]["icon"]),
                  trailing: screens[index]["name"]=="Dark Mode"? Switch(value: false, onChanged: (value) {
                    Get.changeTheme(ThemeData.light());
                  },) : const SizedBox(),
                  title: Text(
                    screens[index]["name"],
                    style: GetTextTheme.fs16_regular,
                  ),
                ),
              ),
    );
  }
}