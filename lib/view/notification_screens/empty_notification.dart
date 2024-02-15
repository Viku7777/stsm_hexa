import 'package:cattel_feed/language/language.dart';
import 'package:cattel_feed/resource/const/icon.dart';
import 'package:cattel_feed/resource/const/textstyle.dart';
import 'package:cattel_feed/resource/component/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class EmptyNotificationView extends StatefulWidget {
  static String routes = "/empty_notification";
  const EmptyNotificationView({super.key});

  @override
  State<EmptyNotificationView> createState() => _EmptyNotificationViewState();
}

class _EmptyNotificationViewState extends State<EmptyNotificationView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(elevation: 0, backgroundColor: Colors.transparent),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(IconsClass.notificationIcon, width: 220.w),
              ],
            ),
            customtextWithGradentColor(
                LanguagesKey.noNotificationYet.tr, GetTextTheme.fs28_bold),
            Text(
              LanguagesKey.noNotficationMessage.tr,
              style: GetTextTheme.fs14_regular,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
