class CartProductModel {
  String? cartId;
  String? createdAt;
  String? uid;
  List<Items>? items;

  CartProductModel({
    this.cartId,
    this.createdAt,
    this.uid,
    this.items,
  });

  CartProductModel.fromJson(Map<String, dynamic> json) {
    cartId = json['order_id'];
    createdAt = json['created_at'];
    uid = json['uid'];
    items = json['items'] == null
        ? []
        : (json['items'] as List).map((e) => Items.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['order_id'] = cartId;
    data['created_at'] = createdAt;
    data['uid'] = uid;
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  String? itemId;
  String? image;
  String? title;
  int? price;
  int? discount;
  int? qnty;
  String? size;
  String? color;

  Items(
      {this.itemId,
      this.image,
      this.title,
      this.price,
      this.discount,
      this.qnty,
      this.size,
      this.color});

  Items.fromJson(Map<String, dynamic> json) {
    itemId = json['item_id'];
    image = json['image'];
    title = json['title'];
    price = json['price'];
    discount = json['discount'];
    qnty = json['qnty'];
    size = json['size'];
    color = json['color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['item_id'] = itemId;
    data['image'] = image;
    data['title'] = title;
    data['price'] = price;
    data['discount'] = discount;
    data['qnty'] = qnty;
    data['size'] = size;
    data['color'] = color;
    return data;
  }
}
