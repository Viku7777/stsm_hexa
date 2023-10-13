import 'package:cattel_feed/Helper/textstyle.dart';
import 'package:cattel_feed/const/colors.dart';
import 'package:cattel_feed/screens/component/appbar_component.dart';
import 'package:cattel_feed/screens/component/custom_text.dart';
import 'package:cattel_feed/screens/ui/homepage/home_view/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

class ChangeLanguageView extends StatefulWidget {
  static String routes = "/account_&_settings/app_setting/change_language";

  const ChangeLanguageView({super.key});

  @override
  State<ChangeLanguageView> createState() => _ChangeLanguageViewState();
}

class _ChangeLanguageViewState extends State<ChangeLanguageView> {
  List language = ["Hindi", "English", "Arabic"];
  String selectValue = "Hindi";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppbar("Change Language"),
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
              customButtonWithGradent("Save", () => null)
            ],
          ),
        ));
 
  }
}
