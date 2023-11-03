class ItemCategoryModel {
  String id, name, image;
  List<String> subCatId;
  ItemCategoryModel(this.id, this.subCatId, this.name, this.image);

  ItemCategoryModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] ?? '',
        subCatId = json['subCatId'] ?? '',
        name = json['name'] ?? '',
        image = json['image'] ?? '';
}
