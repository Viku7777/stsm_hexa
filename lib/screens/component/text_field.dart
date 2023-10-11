// ignore_for_file: must_be_immutable

import 'package:cattel_feed/Helper/textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextfield extends StatelessWidget {
  Icon? prefixIcon;
  Color? filledColor;
  String? hintText;
  InputBorder? border;
  TextEditingController controller;
  Function(String)? onChanged;
  Widget? suffixIcon;
  TextStyle? hintStyle;

  CustomTextfield(
      {super.key,
      this.prefixIcon,
      this.filledColor,
      required this.controller,
      this.hintText,
      this.border,
      this.suffixIcon,
      this.onChanged,
      
      this.hintStyle,
      });

  @override


  
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.only(top: 5.h),
          prefixIcon: prefixIcon,
          suffixIcon:suffixIcon ,
          fillColor: filledColor,
          filled: filledColor != null ? true : false,
          border: border,
          
          hintText: hintText,
          hintStyle: hintStyle ?? GetTextTheme.fs12_regular
              .copyWith(color: const Color(0xff5B5B5B))),
    );
  }
}
