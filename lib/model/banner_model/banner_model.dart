class BannerModel {
  List<Data>? data;
  String? title;

  BannerModel({this.data, this.title});

  BannerModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['title'] = title;
    return data;
  }
}

class Data {
  List<Imagelinks>? imagelinks;

  Data({this.imagelinks});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['imagelinks'] != null) {
      imagelinks = <Imagelinks>[];
      json['imagelinks'].forEach((v) {
        imagelinks!.add(Imagelinks.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (imagelinks != null) {
      data['imagelinks'] = imagelinks!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Imagelinks {
  String? imgUrl;
  String? categoryTitle;
  String? categoryId;

  Imagelinks({this.imgUrl, this.categoryTitle, this.categoryId});

  Imagelinks.fromJson(Map<String, dynamic> json) {
    imgUrl = json['imgUrl'];
    categoryTitle = json['categoryTitle'];
    categoryId = json['categoryId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['imgUrl'] = imgUrl;
    data['categoryTitle'] = categoryTitle;
    data['categoryId'] = categoryId;
    return data;
  }
}
