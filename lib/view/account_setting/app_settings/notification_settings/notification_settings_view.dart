import 'package:cattel_feed/language/language.dart';
import 'package:cattel_feed/resource/const/colors.dart';
import 'package:cattel_feed/resource/const/textstyle.dart';

import 'package:cattel_feed/resource/component/appbar_component.dart';
import 'package:cattel_feed/resource/component/custom_text.dart';
import 'package:cattel_feed/view/homepage/home_view/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationSettingView extends StatefulWidget {
  static String routes = "/account_&_settings/app_setting/notification_setting";

  const NotificationSettingView({super.key});

  @override
  State<NotificationSettingView> createState() =>
      _NotificationSettingViewState();
}

class _NotificationSettingViewState extends State<NotificationSettingView> {
  List notificationSettingsOption = [
    {
      "name": LanguagesKey.notificationSound.tr,
      "value": false,
    },
    {
      "name": LanguagesKey.vibration.tr,
      "value": false,
    },
    {
      "name": LanguagesKey.offerNotification.tr,
      "value": false,
    },
    {
      "name": LanguagesKey.orderNotification.tr,
      "value": false,
    }
  ];
  String selectValue = "Hindi";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(LanguagesKey.notifications.tr),
      body: customListview(
        isverticalAxis: true,
        notificationSettingsOption.length,
        (index) => Column(children: [
          SwitchListTile.adaptive(
            activeColor: AppColors.primaryColor,
            title: customText(notificationSettingsOption[index]["name"],
                GetTextTheme.fs16_regular),
            value: notificationSettingsOption[index]["value"],
            onChanged: (value) {
              notificationSettingsOption[index]["value"] = value;
              setState(() {});
            },
          ),
          const Divider(
            color: Colors.grey,
          ),
        ]),
      ),
    );
  }
}
