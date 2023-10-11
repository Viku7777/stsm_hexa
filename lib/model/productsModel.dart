


  class ProductModel{
String id,name,price,image,type;
bool fav;
List<String> subCat,tag;
ProductModel(this.id,this.name,this.price,this.image,this.type,this.fav,this.subCat,this.tag);


Map tojson()=>  {
    "id": id,
    "name": name,
    "price": price,
    "tag": tag,
    "image":image,
    "fav": fav,
    "type" : type,
    "SubCat_id": subCat,
  };
   ProductModel.fromJson(Map<dynamic, dynamic> json) : id=json["id"],name=json["name"],
   price=json["price"],image=json["image"],type=json["type"],fav=json["fav"],
   subCat=json["SubCat_id"],tag=json["tag"];
  }