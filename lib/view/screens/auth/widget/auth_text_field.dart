import 'package:cattel_feed/Helper/colors.dart';
import 'package:cattel_feed/Helper/textstyle.dart';

import 'package:cattel_feed/view/component/text_field.dart';
import 'package:flutter/material.dart';

Widget authTextField(TextEditingController controller, String title, hint,
    {int? maxLength,
    TextInputType? keyboardType,
    bool isPrefix = false,
    String? Function(String?)? validator}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisSize: MainAxisSize.min,
    children: [
      Text(
        title,
        style: GetTextTheme.fs12_regular,
      ),
      CustomTextfield(
        hintText: isPrefix ? "" : hint,
        prefixText: isPrefix ? hint : "",
        maxLength: maxLength,
        validator: validator,
        keyboardType: keyboardType,
        hintStyle:
            GetTextTheme.fs14_regular.copyWith(color: AppColors.greylightcolor),
        border: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.greylightcolor)),
        controller: controller,
      ),
    ],
  );
}
