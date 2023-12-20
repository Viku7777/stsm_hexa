// ignore_for_file: non_constant_identifier_names

class OldCategoiresModel {
  String title;
  String id, image;

  OldCategoiresModel(this.title, this.id, this.image);

  Map tojson() => {"title": title, "Cat_id": id, "image": image};

  OldCategoiresModel.FromJson(Map<String, dynamic> json, this.id)
      : title = json["title"] ?? "",
        image = json["image"] ?? "";
}

class CategoriesModel {
  CategoriesModel({
    required this.image,
    required this.title,
    required this.status,
    required this.id,
  });
  late final String image;
  late final String title;
  late final String id;
  late final String status;

  CategoriesModel.fromJson(Map<String, dynamic> json, this.id) {
    image = json['image'];
    title = json['title'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['image'] = image;
    data['title'] = title;
    data['status'] = status;
    return data;
  }
}
