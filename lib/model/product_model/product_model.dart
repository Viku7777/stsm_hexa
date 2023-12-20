class ProductModel {
  String? longDescription;
  List<String>? productImages;
  bool? isMultipleVariant;
  String? name;
  String? totalStock;
  bool? freedelivery;
  Categories? categories;
  String? shortDescription;
  String? sku, id;
  List<Varients>? varients;
  String? status;

  ProductModel(
      {this.longDescription,
      this.productImages,
      this.isMultipleVariant,
      this.name,
      this.totalStock,
      this.freedelivery,
      this.categories,
      this.shortDescription,
      this.sku,
      this.id,
      this.varients,
      this.status});

  ProductModel.fromJson(Map<String, dynamic> json, this.id) {
    longDescription = json['longDescription'];

    productImages = json['productImages'].cast<String>();
    isMultipleVariant = json['isMultipleVariant'];
    name = json['name'];

    totalStock = json['totalStock'];
    freedelivery = json['Freedelivery'];
    categories = json['categories'] != null
        ? Categories.fromJson(json['categories'])
        : null;

    shortDescription = json['shortDescription'];
    sku = json['sku'];

    status = json['status'];
    if (json['varients'] != null) {
      varients = <Varients>[];
      json['varients'].forEach((v) {
        varients!.add(Varients.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['longDescription'] = longDescription;
    data['productImages'] = productImages;
    data['isMultipleVariant'] = isMultipleVariant;
    data['name'] = name;
    data['totalStock'] = totalStock;
    data['Freedelivery'] = freedelivery;
    if (categories != null) {
      data['categories'] = categories!.toJson();
    }
    data['shortDescription'] = shortDescription;
    data['sku'] = sku;
    if (varients != null) {
      data['varients'] = varients!.map((v) => v.toJson()).toList();
    }
    data['status'] = status;
    return data;
  }
}

class Categories {
  String? parentId;
  String? name;
  String? id;

  Categories({this.parentId, this.name, this.id});

  Categories.fromJson(Map<String, dynamic> json) {
    parentId = json['parent_id'];
    name = json['name'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['parent_id'] = parentId;
    data['name'] = name;
    data['id'] = id;
    return data;
  }
}

class Varients {
  String? originalPrice;
  String? discount;
  String? discountType;
  String? name;

  Varients({this.originalPrice, this.discount, this.discountType, this.name});

  Varients.fromJson(Map<String, dynamic> json) {
    originalPrice = json['originalPrice'];
    discount = json['discount'].toString();
    discountType = json['discountType'];
    name = json['VarientName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['originalPrice'] = originalPrice;
    data['discount'] = discount;
    data['discountType'] = discountType;
    data['VarientName'] = name;
    return data;
  }
}
