import 'package:cattel_feed/resource/const/colors.dart';
import 'package:cattel_feed/resource/const/showdialog.dart';
import 'package:cattel_feed/resource/const/textstyle.dart';
import 'package:cattel_feed/model/address_model/addressModel.dart';
import 'package:cattel_feed/repository/address_reposotory/address_repository.dart';
import 'package:cattel_feed/resource/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class UserAddressController extends GetxController {
  bool isloading = false;
  int selectIndex = 0;

  List<AddressModel> addresses = [];
  updateAddress(List<AddressModel> newaddresses) {
    addresses = newaddresses;
  }

  updateIndex(int index) {
    selectIndex = index;
    update();
  }

  AddressRepositroy apis = AddressRepositroy();
  updateloading() {
    isloading = !isloading;
    update();
  }

  Future<void> addnewAddress(AddressModel address, BuildContext context) async {
    updateloading();
    apis.addNewAddress(address).then((value) {
      updateloading();
      addresses.add(address);
      update();
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => showSuccessDialog(
                  "Address  Saved",
                  "A new address is successfully added to your address collection.",
                  [
                    10.heightBox,
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size.fromHeight(35.h),
                            backgroundColor: AppColors.greenColor),
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        child: Text("Done",
                            style: GetTextTheme.fs16_regular
                                .copyWith(color: Colors.white))),
                    10.heightBox,
                  ]));
    }).onError((error, stackTrace) {
      updateloading();
      Utils.flushBarErrorMessage(error.toString(), context);
    });
  }
}
