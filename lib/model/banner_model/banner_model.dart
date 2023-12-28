class BannerModel {
  List<BannerDataModel> data;
  String title;

  BannerModel(this.data, this.title);

  BannerModel.fromJson(Map<String, dynamic> json)
      : data = (json['data'] as List)
            .map((e) => BannerDataModel.fromJson(e))
            .toList(),
        title = json['title'] ?? "";
}

class BannerDataModel {
  String imgUrl;
  String categoryTitle;
  String categoryId;

  BannerDataModel(this.imgUrl, this.categoryTitle, this.categoryId);

  BannerDataModel.fromJson(Map<String, dynamic> json)
      : imgUrl = json['imgUrl'] ?? "",
        categoryTitle = json['categoryTitle'] ?? "",
        categoryId = json['categoryId'] ?? "";
}
