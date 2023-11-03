import 'package:cattel_feed/model/item_model.dart';

class ProductModels {
  String id, name, price, image, type;
  bool fav;

  List<String> itemCatId, tag;
  ProductModels(this.id, this.name, this.price, this.image, this.type, this.fav,
      this.itemCatId, this.tag);

  Map tojson() => {
        "id": id,
        "name": name,
        "price": price,
        "tag": tag,
        "image": image,
        "fav": fav,
        "type": type,
        "SubCat_id": itemCatId,
      };
  ProductModels.fromJson(Map<dynamic, dynamic> json)
      : id = json["id"],
        name = json["name"],
        price = json["price"],
        image = json["image"],
        type = json["type"],
        fav = json["fav"],
        itemCatId = json["SubCat_id"],
        tag = json["tag"];
}

class ProductModel {
  String name, image, categoiresID, subcategoriesID;
  List<String> itemid;

  ProductModel(this.name, this.image, this.categoiresID, this.subcategoriesID,
      this.itemid);

  Map tojson() => {
        "name": name,
        "image": image,
        "categoiresID": categoiresID,
        "subcategoriesID": subcategoriesID,
        "itemid": itemid,
      };
  ProductModel.fromJson(Map<dynamic, dynamic> json)
      : name = json["name"],
        image = json["image"],
        categoiresID = json["categoiresID"],
        subcategoriesID = json["subcategoriesID"],
        itemid = json["itemid"];
}
