class ItemModel {
  String productName, description, itemdetails, sellerid, itemid;
  double oldprice, currentprice;
  bool isFav;
  List<String> images;
  List<ItemSizeModel> size;
  ItemModel(
      this.productName,
      this.description,
      this.itemdetails,
      this.sellerid,
      this.itemid,
      this.oldprice,
      this.currentprice,
      this.isFav,
      this.images,
      this.size);

  Map<String, dynamic> toJson() {
    return {
      "productName": productName,
      "description": description,
      "itemdetails": itemdetails,
      "sellerid": sellerid,
      "itemid": itemid,
      "oldprice": oldprice,
      "currentprice": currentprice,
      "isFav": isFav,
      "images": images,
      "size": size
    };
  }

  ItemModel.toJson(Map<String, dynamic> json)
      : productName = json["productName"],
        description = json["description"],
        itemdetails = json["itemdetails"],
        sellerid = json["sellerid"],
        itemid = json["itemid"],
        oldprice = json["oldprice"],
        currentprice = json["currentprice"],
        isFav = json["isFav"],
        images = json["images"],
        size = json["size"];
}

class ItemSizeModel {
  String size;
  double price;
  ItemSizeModel(this.size, this.price);

  Map<String, dynamic> toJson() {
    return {"size": size, "price": price};
  }

  ItemSizeModel.fromJson(Map<String, dynamic> json)
      : size = json["size"],
        price = json["price"];
}
