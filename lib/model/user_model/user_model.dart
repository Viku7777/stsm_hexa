import 'package:cattel_feed/model/address_model/addressModel.dart';

class UserModel {
  String uid;
  String authenticationMethod;
  String name;
  String phone;
  String email;
  String gender;
  String city;
  String state;
  String bio;
  String image;
  bool isCustomer;
  bool isSalesman;
  bool isWholesaler;
  String businessId;
  String createdAt;
  String updatedAt;
  List<String> devicesToken;
  List<AddressModel> addresses;
  UserModel({
    required this.uid,
    required this.authenticationMethod,
    required this.name,
    required this.isCustomer,
    required this.createdAt,
    required this.addresses,
    required this.devicesToken,
    this.phone = "",
    this.email = "",
    this.gender = "",
    this.city = "",
    this.state = "",
    this.bio = "",
    this.image = "",
    this.isSalesman = false,
    this.isWholesaler = false,
    this.businessId = "",
    this.updatedAt = "",
  });

  UserModel.fromJson(Map<String, dynamic> json)
      : uid = json['uid'],
        authenticationMethod = json['authentication_method'],
        name = json['name'],
        phone = json['phone'],
        email = json['email'],
        gender = json['gender'],
        city = json['city'],
        state = json['state'],
        bio = json['bio'],
        image = json['image'],
        isCustomer = json['is_customer'],
        isSalesman = json['is_salesman'],
        isWholesaler = json['is_wholesaler'],
        businessId = json['business_id'],
        createdAt = json['created_at'],
        updatedAt = json['updated_at'],
        devicesToken = [],
        addresses = List.from(json['addresses'])
            .map((e) => AddressModel.fromJson(e))
            .toList();

  Map<String, dynamic> toJson() {
    // ignore: no_leading_underscores_for_local_identifiers
    final _data = <String, dynamic>{};
    _data['uid'] = uid;
    _data['authentication_method'] = authenticationMethod;
    _data['name'] = name;
    _data['phone'] = phone;
    _data['email'] = email;
    _data['gender'] = gender;
    _data['city'] = city;
    _data['state'] = state;
    _data['bio'] = bio;
    _data['image'] = image;
    _data['is_customer'] = isCustomer;
    _data['is_salesman'] = isSalesman;
    _data['is_wholesaler'] = isWholesaler;
    _data['business_id'] = businessId;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['devices_token'] = devicesToken;
    _data['addresses'] = addresses;
    return _data;
  }
}
