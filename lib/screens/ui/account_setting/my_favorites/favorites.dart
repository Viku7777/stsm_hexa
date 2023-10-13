import 'package:cattel_feed/backend/dummyData.dart';
import 'package:cattel_feed/model/productsModel.dart';
import 'package:cattel_feed/screens/component/appbar_component.dart';
import 'package:cattel_feed/screens/ui/homepage/home_view/widgets.dart';
import 'package:cattel_feed/screens/ui/homepage/item_List/item_view_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavoritesItemView extends StatelessWidget {
    static String routes = "/account_&_settings/wishlist";

  const FavoritesItemView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: customAppbar("My Favorites / Wishlist"),
      body: customGridVIew(dummyitems.length, .75, 2, (index) {
         List<ProductModel>items = dummyitems.map((e) => ProductModel.fromJson(e)).toList();
                return ItemViewTiel(item: items[index],);
      },isScrollAble: true)
  
    );
  }
}