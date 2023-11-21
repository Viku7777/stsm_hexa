import 'package:cattel_feed/Helper/colors.dart';
import 'package:cattel_feed/controller/loading_Controller/loading_controller.dart';
import 'package:cattel_feed/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShowLoading extends StatelessWidget {
  const ShowLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoadingController>(
      autoRemove: true,
      builder: (controller) {
        return controller.isLoading
            ? Container(
                height: screenSize.height,
                width: screenSize.width,
                color: Colors.black.withOpacity(.3),
                alignment: Alignment.center,
                child: CircularProgressIndicator(
                  color: AppColors.primaryColor,
                ),
              )
            : const SizedBox();
      },
    );
  }
}
