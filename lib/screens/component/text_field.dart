// ignore_for_file: must_be_immutable

import 'package:cattel_feed/Helper/textstyle.dart';
import 'package:cattel_feed/const/colors.dart';
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

  CustomTextfield({
    super.key,
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
      cursorColor: AppColors.primaryColor,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.only(top: 5.h),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          fillColor: filledColor,
          filled: filledColor != null ? true : false,
          focusedBorder: border,
          hintText: hintText,
          hintStyle: hintStyle ??
              GetTextTheme.fs12_regular
                  .copyWith(color: const Color(0xff5B5B5B))),
    );
  }
}

class CustomSearchTextTiel extends StatelessWidget {
  TextEditingController controller;
  CustomSearchTextTiel({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: AppColors.primaryColor,
      controller: controller,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(top: 5.h),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400, width: 1.5),
            borderRadius: BorderRadius.circular(10.sp)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400, width: 1.5),
            borderRadius: BorderRadius.circular(10.sp)),
        prefixIcon: Icon(
          Icons.search,
          color: Colors.grey.shade400,
        ),
        suffixIcon: const Icon(Icons.sort, color: Colors.black),
        hintText: "Search by Keyword or Product ID",
        hintStyle: GetTextTheme.fs14_regular.copyWith(color: AppColors.greylightcolor)
      ),
    );
  }
}
