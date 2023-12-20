// ignore_for_file: non_constant_identifier_names, unused_import

import 'package:flutter/material.dart';

class OldSubCategoriesModel {
  String title, id, image, categoiresID;
  OldSubCategoriesModel(this.title, this.id, this.categoiresID, this.image);

  Map tojson() => {
        "title": title,
        "SubCat_id": id,
        "cat_ID": categoiresID,
        "image": image,
      };

  OldSubCategoriesModel.FromJson(Map<String, dynamic> json, this.id)
      : title = json["title"] ?? "",
        categoiresID = json["cat_ID"] ?? "",
        image = json["image"] ?? "";
}

class SubCategoriesModel {
  SubCategoriesModel({
    required this.image,
    required this.catID,
    required this.title,
    required this.status,
    required this.id,
  });
  late final String image;
  late final String catID;
  late final String title;
  late final String status;
  late final String id;

  SubCategoriesModel.fromJson(Map<String, dynamic> json, this.id) {
    image = json['image'];
    catID = json['cat_ID'];
    title = json['title'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['image'] = image;
    data['cat_ID'] = catID;
    data['title'] = title;
    data['status'] = status;
    return data;
  }
}
