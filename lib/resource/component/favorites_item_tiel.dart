// ignore_for_file: must_be_immutable

import 'package:cattel_feed/Helper/colors.dart';
import 'package:cattel_feed/view_model/controller/item_favorite.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoriteItemTiel extends StatelessWidget {
  String itemId;
  FavoriteItemTiel({super.key, required this.itemId});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
        backgroundColor: Colors.white,
        child: GetBuilder<FavoriteItemController>(builder: (controller) {
          return IconButton(
              onPressed: () {
                controller.updateItem(itemId);
              },
              icon:
                  controller.allfavoriteItem.any((element) => element == itemId)
                      ? const Icon(
                          Icons.favorite,
                        )
                      : const Icon(Icons.favorite_border),
              color: AppColors.redColor);
        }));
  }
}
