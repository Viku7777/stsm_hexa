// ignore_for_file: non_constant_identifier_names, unused_import

import 'package:flutter/material.dart';

class SubCategoriesModel{
String title,id;
List  categoiresID;
SubCategoriesModel(this.title,this.id,this.categoiresID);

Map tojson ()=> {
  "SubCat_title" : title,
  "SubCat_id": id,
  "Cat_id" : categoiresID,
};

SubCategoriesModel.FromJson(Map<String,dynamic> json) : title = json["SubCat_title"], id=json["SubCat_id"],categoiresID = json["Cat_id"];

}