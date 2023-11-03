// ignore_for_file: file_names

import 'package:cattel_feed/model/item_model.dart';
import 'package:get/get.dart';

class SimilarProductController extends GetxController {
  late List<ItemModel> _allItems;
  List<ItemModel> get allitems => _allItems;
  updateItemList(List<ItemModel> items) {
    _allItems = items;
    update();
  }

  updateFavItem(String itemID) {
    for (var element in allitems) {
      if (element.itemid == itemID) {
        element.isFav != element.isFav;
      }
    }

    update();
  }
}
