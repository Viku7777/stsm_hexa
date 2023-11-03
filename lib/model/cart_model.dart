class CartModel {
  String itemID;
  int quantity;
  CartModel(this.itemID, this.quantity);

  Map<String, dynamic> tojson() {
    return {
      "itemID": itemID,
      "quantity": quantity,
    };
  }

  CartModel.fromjson(Map<String, dynamic> json)
      : itemID = json["itemID"],
        quantity = json["quantity"];
}
