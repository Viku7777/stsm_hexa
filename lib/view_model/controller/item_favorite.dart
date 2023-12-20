import 'package:cattel_feed/resource/sf/offline_storage.dart';
import 'package:get/get.dart';

class FavoriteItemController extends GetxController {
  List<String> allfavoriteItem = [];
  updateFavoriteItemList() async {
    allfavoriteItem = await SFStorage.getSFList(
      SFStorage.savedFavoriteItemKey,
    );
  }

  updateItem(String itemId) {
    if (allfavoriteItem.contains(itemId)) {
      allfavoriteItem.removeWhere((element) => element == itemId);
    } else {
      allfavoriteItem.add(itemId);
    }
    update();
    SFStorage.setSFList(SFStorage.savedFavoriteItemKey, allfavoriteItem);
  }
}
