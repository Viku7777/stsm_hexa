// i created this model for budget store
class BudgetStoreModel {
  String id, price;
  BudgetStoreModel(this.id, this.price);
}

// This Images show according to brand

class ShopBrandsModel {
  String id, image;
  ShopBrandsModel(this.id, this.image);
}

// This Model Show top products for users

class ProductsModel {
  String id, image, productName, spikeThroughAmount, amount, ratings;

  ProductsModel(this.id, this.image, this.productName, this.spikeThroughAmount,
      this.amount, this.ratings);
}
