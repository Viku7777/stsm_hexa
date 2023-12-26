import 'package:cattel_feed/model/product_model/product_model.dart';
import 'package:cattel_feed/resource/component/appbar_component.dart';
import 'package:cattel_feed/view/account_setting/my_favorites/empty_wishlist.dart';
import 'package:cattel_feed/view/homepage/home_view/widgets.dart';
import 'package:cattel_feed/view/homepage/item_List/item_view_tile.dart';
import 'package:cattel_feed/view_model/controller/app_data_controller.dart';
import 'package:cattel_feed/view_model/controller/item_favorite.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoritesItemView extends StatelessWidget {
  static String routes = "/account_&_settings/wishlist";

  const FavoritesItemView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar("My Favorites / Wishlist"),
      body: GetBuilder<FavoriteItemController>(builder: (controller) {
        if (controller.allfavoriteItem.isEmpty) {
          return const EmptyWishlistVIew();
        } else {
          var appdata = Get.find<AppData>();
          List<ProductModel> products = appdata.products
              .where((element) =>
                  controller.allfavoriteItem.any((e) => element.id == e))
              .toList();
          return customGridVIew(products.length, .75, 2, (index) {
            return ItemViewTiel(
              product: products[index],
              showMore: true,
            );
          }, isScrollAble: true);
        }
      }),
    );
  }
}
