import 'package:cattel_feed/model/item_model.dart';
import 'package:get/get.dart';

class ItemListController extends GetxController {
  late List<ItemModel> _allItems;
  List<ItemModel> get allitems => _allItems;
  updateItemList(List<ItemModel> items) {
    _allItems = items;
    update();
  }

  updateFavItem(
    String itemID,
  ) {
    int index = _allItems.indexWhere((element) => element.itemid == itemID);
    _allItems[index].isFav = !_allItems[index].isFav;
    update();
  }
}

class ItemDetailsController extends GetxController {
  late ItemModel currentitem;
  updateItem(item) {
    currentprice = 0;
    selectsize = "";
    currentitem = item;
    update();
  }

  double currentprice = 0;
  String selectsize = "";
  updateSize(size) {
    selectsize = size;
    currentprice =
        currentitem.size.firstWhere((element) => element.size == size).price;
    update();
  }
}
