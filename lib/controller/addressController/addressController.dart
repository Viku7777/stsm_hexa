import 'package:cattel_feed/backend/dummyData.dart';
import 'package:cattel_feed/model/addressModel.dart';
import 'package:cattel_feed/view/screens/address/all_address/all_address.dart';
import 'package:get/get.dart';

class AddressController extends GetxController {
  AddressModel currentAddresstitle =
      AddressModel.fromJson(allAddressDummyData[0]);

  updateAddress(AddressModel model) {
    currentAddresstitle = model;
    update();
  }
}
