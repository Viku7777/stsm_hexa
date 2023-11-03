import 'package:cattel_feed/backend/dummyData.dart';
import 'package:cattel_feed/controller/item_details_controller/item_view_controller.dart';
import 'package:cattel_feed/model/item_model.dart';
import 'package:cattel_feed/model/productsModel.dart';
import 'package:cattel_feed/view/component/appbar_component.dart';
import 'package:cattel_feed/view/screens/account_setting/my_favorites/empty_wishlist.dart';
import 'package:cattel_feed/view/screens/homepage/home_view/widgets.dart';
import 'package:cattel_feed/view/screens/homepage/item_List/item_view_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoritesItemView extends StatelessWidget {
  static String routes = "/account_&_settings/wishlist";

  const FavoritesItemView({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ItemListController());
    return Scaffold(
      appBar: customAppbar("My Favorites / Wishlist"),
      body: GetBuilder<ItemListController>(builder: (controller) {
        List<ItemModel> itemlist = controller.allitems
            .where((element) => element.isFav == true)
            .toList();
        if (itemlist.isEmpty) {
          return const EmptyWishlistVIew();
        } else {
          return customGridVIew(itemlist.length, .75, 2, (index) {
            return ItemViewTiel(
              items: itemlist[index],
            );
          }, isScrollAble: true);
        }
      }),
    );
  }
}
