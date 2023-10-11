import 'package:cattel_feed/screens/component/appbar_component.dart';
import 'package:flutter/material.dart';

class FavoritesItemView extends StatelessWidget {
    static String routes = "/wishlist";

  const FavoritesItemView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: customAppbar("My Favorites / Wishlist"),
    );
  }
}