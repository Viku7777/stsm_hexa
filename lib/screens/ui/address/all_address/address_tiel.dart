import 'package:cattel_feed/Helper/textstyle.dart';
import 'package:cattel_feed/screens/component/custom_text.dart';
import 'package:cattel_feed/screens/component/icon_with_gradinet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

class AddressTiel extends StatelessWidget {
  const AddressTiel({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin:  EdgeInsets.symmetric(horizontal: 10.w,vertical: 3.h),
      padding: const EdgeInsets.all(10),
      color: const Color(0xfffbf2f2),
      child: Column(
        children: [
          Row(
            children: [
               customText("Home",GetTextTheme.fs16_bold),
              10.widthBox,
              customIconWithGradient(Icons.edit_outlined),
              const Spacer(),
              Radio(
                activeColor: Colors.red,
                value: "Selected", groupValue: "Selected", onChanged: (value) {},),
            ],
          ),
          customText("Lorem ipsum dolor sit amet consectetur. Ornare pulvinar a porta egestas eu. Turpis integer ultricies lorem euismod malesuada in quis vitae nunc. Ut integer proin.", GetTextTheme.fs14_regular)
        ],
      ),
    );
  }
}