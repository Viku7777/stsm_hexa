class CartProductModel {
  String? orderId;
  String? createdAt;
  int? orderPrice;
  String? uid;
  int? shippingCharge;
  int? serviceCharge;
  int? promoDiscount;
  Transaction? transaction;
  Customer? customer;
  List<Items>? items;
  Shipping? shipping;

  CartProductModel(
      {this.orderId,
      this.createdAt,
      this.orderPrice,
      this.uid,
      this.shippingCharge,
      this.serviceCharge,
      this.promoDiscount,
      this.transaction,
      this.customer,
      this.items,
      this.shipping});

  CartProductModel.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    createdAt = json['created_at'];
    orderPrice = json['order_price'];
    uid = json['uid'];
    shippingCharge = json['shipping_charge'];
    serviceCharge = json['service_charge'];
    promoDiscount = json['promo_discount'];
    transaction = json['transaction'] != null
        ? Transaction.fromJson(json['transaction'])
        : null;
    customer =
        json['customer'] != null ? Customer.fromJson(json['customer']) : null;
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(Items.fromJson(v));
      });
    }
    shipping =
        json['shipping'] != null ? Shipping.fromJson(json['shipping']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['order_id'] = orderId;
    data['created_at'] = createdAt;
    data['order_price'] = orderPrice;
    data['uid'] = uid;
    data['shipping_charge'] = shippingCharge;
    data['service_charge'] = serviceCharge;
    data['promo_discount'] = promoDiscount;
    if (transaction != null) {
      data['transaction'] = transaction!.toJson();
    }
    if (customer != null) {
      data['customer'] = customer!.toJson();
    }
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    if (shipping != null) {
      data['shipping'] = shipping!.toJson();
    }
    return data;
  }
}

class Transaction {
  bool? status;
  String? txId;
  String? date;
  String? mode;

  Transaction({this.status, this.txId, this.date, this.mode});

  Transaction.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    txId = json['tx_id'];
    date = json['date'];
    mode = json['mode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['tx_id'] = txId;
    data['date'] = date;
    data['mode'] = mode;
    return data;
  }
}

class Customer {
  String? name;
  String? phone;
  String? email;
  String? image;

  Customer({this.name, this.phone, this.email, this.image});

  Customer.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['phone'] = phone;
    data['email'] = email;
    data['image'] = image;
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

class Shipping {
  String? address;
  String? lat;
  String? long;
  String? addressTitle;
  String? contactPerson;
  String? contactNo;

  Shipping(
      {this.address,
      this.lat,
      this.long,
      this.addressTitle,
      this.contactPerson,
      this.contactNo});

  Shipping.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    lat = json['lat'];
    long = json['long'];
    addressTitle = json['address_title'];
    contactPerson = json['contact_person'];
    contactNo = json['contact_no.'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['address'] = address;
    data['lat'] = lat;
    data['long'] = long;
    data['address_title'] = addressTitle;
    data['contact_person'] = contactPerson;
    data['contact_no.'] = contactNo;
    return data;
  }
}
