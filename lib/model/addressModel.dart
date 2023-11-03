// ignore_for_file: file_names

class AddressModel {
  String houseno, colony, landmark, city, state, addresstitle, name, number;
  int pincode;
  String? lat;
  String? lng;

  AddressModel(this.houseno, this.colony, this.landmark, this.city, this.state,
      this.addresstitle, this.name, this.number, this.pincode,
      {String lat = "", String lng = ""});

  Map<String, dynamic> toJson() => {
        "house_no": houseno,
        "colony": colony,
        "landmark": landmark,
        "city": city,
        "state": state,
        "title": addresstitle,
        "name": name,
        "number": number,
        "pincode": pincode,
        "lat": lat,
        "lng": lng
      };
  AddressModel.fromJson(Map<String, dynamic> json)
      : houseno = json["house_no"] ?? "",
        colony = json["colony"] ?? "",
        landmark = json["landmark"],
        city = json["city"],
        state = json["state"],
        addresstitle = json["title"],
        name = json["name"],
        number = json["number"],
        pincode = json["pincode"],
        lat = json["lat"] ?? "",
        lng = json["lng"] ?? "";
}
