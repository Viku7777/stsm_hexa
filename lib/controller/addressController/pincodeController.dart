// ignore_for_file: file_names

import 'package:cattel_feed/backend/dummyData.dart';
import 'package:get/get.dart';

class PincodeController extends GetxController {
  final RxString _searchPin = "".obs;
  final RxList _availablepins = availablepincodes.obs;
  List get availablepins => _availablepins;
  String get searchPin => _searchPin.value;
  updateSearch(String search) {
    _searchPin.value = search;
  }
}
