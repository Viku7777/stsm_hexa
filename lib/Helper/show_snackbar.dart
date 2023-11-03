import 'package:cattel_feed/Helper/colors.dart';
import 'package:cattel_feed/Helper/textstyle.dart';
import 'package:flutter/material.dart';

void showSnackbar(BuildContext context, String title) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(title, style: const TextStyle(color: Colors.white)),
    backgroundColor: AppColors.redColor,
  ));
}
