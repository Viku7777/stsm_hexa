// ignore_for_file: file_names

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

class ProductItemModel {
  ProductItemModel({
    required this.image,
    required this.discription,
    required this.deliveryCharge,
    required this.sizes,
    required this.price,
    required this.subCatID,
    required this.catID,
    required this.discountValue,
    required this.createdAt,
    required this.store,
    required this.discountType,
    required this.title,
  });
  late final List<String> image;
  late final String discription;
  late final int deliveryCharge;
  late final List<Sizes> sizes;
  late final String price;
  late final String subCatID;
  late final String catID;
  late final String discountValue;
  late final String createdAt;
  late final String store;
  late final String discountType;
  late final String title;
  late final String id;

  ProductItemModel.fromJson(Map<String, dynamic> json, this.id) {
    image = List.castFrom<dynamic, String>(json['image']);
    discription = json['discription'] ?? "";
    deliveryCharge = json['delivery_charge'] ?? 0;
    sizes = List.from(json['sizes']).map((e) => Sizes.fromJson(e)).toList();
    price = json['price'] ?? "";
    subCatID = json['sub_cat_ID'] ?? "";
    catID = json['cat_ID'] ?? "";
    discountValue = json['discount_value'] ?? "";
    createdAt = json['created_at'] ?? "";
    store = json['store'] ?? "";
    discountType = json['discount_type'] ?? "";
    title = json['title'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['image'] = image;
    data['discription'] = discription;
    data['delivery_charge'] = deliveryCharge;
    data['sizes'] = sizes.map((e) => e.toJson()).toList();
    data['price'] = price;
    data['sub_cat_ID'] = subCatID;
    data['cat_ID'] = catID;
    data['discount_value'] = discountValue;
    data['created_at'] = createdAt;
    data['store'] = store;
    data['discount_type'] = discountType;
    data['title'] = title;

    return data;
  }
}

class Sizes {
  Sizes({
    required this.amount,
    required this.title,
  });
  late final int amount;
  late final String title;

  Sizes.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['amount'] = amount;
    data['title'] = title;
    return data;
  }
}
