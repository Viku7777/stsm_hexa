import 'package:cattel_feed/resource/component/appbar_component.dart';
import 'package:cattel_feed/resource/const/icon.dart';
import 'package:cattel_feed/resource/const/textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

class HelpView extends StatefulWidget {
  static String routes = "/account_&_settings/help";
  const HelpView({super.key});

  @override
  State<HelpView> createState() => _HelpViewState();
}

class _HelpViewState extends State<HelpView> {
  List helpOption = [
    {"option": "Customer Services", "img": IconsClass.help1, "route": ""},
    {"option": "WhatsApp Support", "img": IconsClass.help2, "route": ""},
    {"option": "Visit Website", "img": IconsClass.help3, "route": ""},
    {"option": "Request Account Delete", "img": IconsClass.help4, "route": ""},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar("Help Center"),
      body: Column(
        children: helpOption.generate((index) {
          var data = helpOption[index];
          return ListTile(
            onTap: () {},
            leading: Image.asset(
              data["img"],
              height: 25.h,
              width: 25.w,
            ),
            title: Text(
              data["option"],
              style: GetTextTheme.fs14_medium,
            ),
            trailing: Icon(
              Icons.arrow_forward_ios_rounded,
              color: Colors.black,
              size: 20.r,
            ),
          );
        }),
      ),
    );
  }
}
