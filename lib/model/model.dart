// This Model show Cateogry
class CategoryModel {
  String id, productName, image;
  CategoryModel(this.id, this.productName, this.image);
}

// This model show discounts & Offers
class DiscountModel {
  String id, image;
  DiscountModel(this.id, this.image);
}

// This model show Weekly Deals
class WeeklyDealsModel {
  String id, productName, image;
  WeeklyDealsModel(this.id, this.productName, this.image);
}

// This model show Kids Garment Accessories
class KidsGarmentModel {
  String id, productName, image;
  KidsGarmentModel(this.id, this.productName, this.image);
}

// i created this model for budget store
class BudgetStoreModel {
  String id, price;
  BudgetStoreModel(this.id, this.price);
}

// I created this model for mens budget store
class MensBudgestStoreModel {
  String id, image, productName, price;

  MensBudgestStoreModel(this.id, this.image, this.productName, this.price);
}

// I created this model for trending store View
class TrendingStoreModel {
  String id, image, productName;

  TrendingStoreModel(this.id, this.image, this.productName);
}

// I created this model for trending store View
class ElectronicStoreModel {
  String id, image, productName, price;

  ElectronicStoreModel(this.id, this.image, this.productName, this.price);
}

// I created this model for showing other
// other accessories like - Mobile covers, earphones
class OtherAccessoriesModel {
  String id, productName, image;
  OtherAccessoriesModel(this.id, this.productName, this.image);
}

// I created this mode for showing other
// Electronics categories washing machine
// freeze, air conditioners

class ExploreMoreModel {
  String id, productName, image;
  ExploreMoreModel(this.id, this.productName, this.image);
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
