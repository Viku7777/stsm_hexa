import 'package:cattel_feed/resource/const/colors.dart';
import 'package:cattel_feed/main.dart';
import 'package:flutter/material.dart';

class ShowLoading extends StatelessWidget {
  const ShowLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenSize.height,
      width: screenSize.width,
      color: Colors.black.withOpacity(.3),
      alignment: Alignment.center,
      child: CircularProgressIndicator(
        color: AppColors.primaryColor,
      ),
    );
  }
}
