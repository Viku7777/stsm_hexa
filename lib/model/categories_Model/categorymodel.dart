class CategoriesModel {
  CategoriesModel(
      {required this.image,
      required this.title,
      required this.status,
      required this.id,
      required this.homepagelayout});
  late final String image;
  late final String title;
  late final String id;
  late final String status;
  late final String homepagelayout;

  CategoriesModel.fromJson(Map<String, dynamic> json, this.id) {
    image = json['image'];
    title = json['title'];
    status = json['status'];
    homepagelayout = json["homepagelayout"] ?? "";
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['image'] = image;
    data['title'] = title;
    data['status'] = status;
    return data;
  }
}
