import 'dart:convert';

import 'package:cattel_feed/view/sf/offline_storage.dart';
import 'package:get/get.dart';

class FavoritesItemController extends GetxController {
  List allFavItems = [];
  updateList(fav) {
    allFavItems = fav;
    update();
  }

  updatrFavItem(String id) {
    if (allFavItems.contains(id)) {
      allFavItems.removeWhere((element) => element == id);
    } else {
      allFavItems.add(id);
    }
    setSFData("logginUserFavItem", jsonEncode(allFavItems));
    update();
  }
}
