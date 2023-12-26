class SubCategoriesModel {
  SubCategoriesModel({
    required this.image,
    required this.catID,
    required this.title,
    required this.status,
    required this.id,
  });
  late final String image;
  late final String catID;
  late final String title;
  late final String status;
  late final String id;

  SubCategoriesModel.fromJson(Map<String, dynamic> json, this.id) {
    image = json['image'];
    catID = json['cat_ID'];
    title = json['title'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['image'] = image;
    data['cat_ID'] = catID;
    data['title'] = title;
    data['status'] = status;
    return data;
  }
}
