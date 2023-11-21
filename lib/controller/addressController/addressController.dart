// ignore_for_file: file_names

import 'package:cattel_feed/model/addressModel.dart';
import 'package:get/get.dart';

class AddressController extends GetxController {
  List<AddressModel> userAllAddresses = [];
  int selectIndex = 0;
  updateIndex(int index) {
    selectIndex = index;
    update();
  }

  updateUserAllAddresses(List<AddressModel> addresses) {
    userAllAddresses = addresses;
    update();
  }

  addNewAddress(AddressModel address) {
    userAllAddresses.add(address);
    update();
  }

  editAddress(int index, AddressModel address) async {
    userAllAddresses[index] = address;
    update();
  }
}
