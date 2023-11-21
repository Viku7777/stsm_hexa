import 'package:cattel_feed/controller/fav_item_controller/fav_item_controller.dart';
import 'package:cattel_feed/global/global.dart';
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
    // var controller = Get.put(FavoritesItemController());
    return Scaffold(
      appBar: customAppbar("My Favorites / Wishlist"),
      body: GetBuilder<FavoritesItemController>(builder: (controller) {
        if (controller.allFavItems.isEmpty) {
          return const EmptyWishlistVIew();
        } else {
          List<ProductItemModel> products = FirebaseData.products!
              .where((e) =>
                  controller.allFavItems.any((element) => element == e.id))
              .toList();
          return customGridVIew(products.length, .75, 2, (index) {
            return ItemViewTiel(
              product: products[index],
            );
          }, isScrollAble: true);
        }
      }),
    );
  }
}
