// ignore_for_file: constant_identifier_names

import 'package:cattel_feed/view_model/controller/cart_model.dart';

enum OrderStatus {
  NEW,
  PROCESSING,
  CANCELLED,
  REJECTED,
  DELIVERED,
  DISPATCHED,
  RETURNED
}

class OrderModel {
  String? orderId;
  String? createdAt;
  int? orderPrice;
  String? uid, deliverydate;
  int? shippingCharge;
  int? serviceCharge;
  int? promoDiscount;
  Transaction? transaction;
  Customer? customer;
  List<CartItems>? items;
  Shipping? shipping;
  OrderStatus? orderStatus;

  OrderModel(
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
      this.shipping,
      this.orderStatus});

  OrderModel.fromJson(this.orderId, Map<String, dynamic> json) {
    createdAt = json['created_at'];
    orderPrice = json['order_price'];
    uid = json['uid'];
    items = json['items'] == null
        ? []
        : (json['items'] as List).map((e) => CartItems.fromJson(e)).toList();
    shippingCharge = json['shipping_charge'];
    serviceCharge = json['service_charge'];
    promoDiscount = json['promo_discount'];
    deliverydate = json["delivery_date"] ?? "";
    transaction = json['transaction'] != null
        ? Transaction.fromJson(json['transaction'])
        : null;
    customer =
        json['customer'] != null ? Customer.fromJson(json['customer']) : null;
    shipping =
        json['shipping'] != null ? Shipping.fromJson(json['shipping']) : null;
    orderStatus = json['status'] == null
        ? OrderStatus.NEW
        : OrderStatus.values
            .where((element) =>
                element.name.trim().toLowerCase() ==
                json['status'].toString().trim().toLowerCase())
            .first;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
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
    data['status'] =
        orderStatus == null ? OrderStatus.NEW.name : orderStatus!.name;
    return data;
  }
}

class Transaction {
  String? status;
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
