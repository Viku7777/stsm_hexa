// ignore_for_file: non_constant_identifier_names

class CategoiresModel {
  String title;
  String id, image;

  CategoiresModel(this.title, this.id, this.image);

  Map tojson() => {"Cat_title": title, "Cat_id": id, "image": image};

  CategoiresModel.FromJson(Map<String, dynamic> json)
      : title = json["Cat_title"],
        id = json["Cat_id"],
        image = json["image"];
}
