class ReviewModel {
  String username, productId, time, discription;
  double rating;

  ReviewModel(
      {required this.username,
      required this.productId,
      required this.rating,
      required this.time,
      required this.discription});
  Map<String, dynamic> toJson() {
    return {
      "user_name": username,
      "product_Id": productId,
      "rating": rating,
      "time": time,
      "discription": discription,
    };
  }

  ReviewModel.fromJson(Map<String, dynamic> json)
      : username = json["user_name"],
        productId = json["productId"],
        rating = json["rating"],
        time = json["time"],
        discription = json["discription"];
}
