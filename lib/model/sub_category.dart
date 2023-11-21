// ignore_for_file: non_constant_identifier_names, unused_import

import 'package:flutter/material.dart';

class SubCateModel {
  String title, id, image;
  List categoiresID;
  SubCateModel(this.title, this.id, this.categoiresID, this.image);

  Map tojson() => {
        "SubCat_title": title,
        "SubCat_id": id,
        "Cat_id": categoiresID,
        "image": image,
      };

  SubCateModel.FromJson(Map<String, dynamic> json)
      : title = json["SubCat_title"],
        id = json["SubCat_id"],
        categoiresID = json["Cat_id"],
        image = json["image"];
}

class SubCategoriesModel {
  String title, id, image, categoiresID;
  SubCategoriesModel(this.title, this.id, this.categoiresID, this.image);

  Map tojson() => {
        "title": title,
        "SubCat_id": id,
        "cat_ID": categoiresID,
        "image": image,
      };

  SubCategoriesModel.FromJson(Map<String, dynamic> json, this.id)
      : title = json["title"] ?? "",
        categoiresID = json["cat_ID"] ?? "",
        image = json["image"] ?? "";
}
