// ignore: unused_import
import 'package:cattel_feed/helper/icon.dart';
import 'package:cattel_feed/model/categorymodel.dart';
import 'package:cattel_feed/model/item_model.dart';
import 'package:cattel_feed/model/productsModel.dart';
import 'package:cattel_feed/model/reviewmodel.dart';
import 'package:cattel_feed/model/sub_category.dart';

List categoriesDummyData = [
  "All",
  "Khal",
  "Binola",
  "Churi & Feed",
  "Sabut Anaj",
  "Desi Chana",
  "Oil & Ghee",
  "Methi Dana"
];

// dummy product data
List<CategoiresModel> dummyCategoires = [
  CategoiresModel("Men", "Cat_Men",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTewT9Vy_oXNqPfsYtGUEMvKYpPSWssE07c3w&usqp=CAU"),
  CategoiresModel("Women", "Cat_Women",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJFDnEkflCwHxA8MlLbcEY6MJxd3rdjf1m8w&usqp=CAU"),
  CategoiresModel("Kids", "Cat_Kids",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ00iIpXnbI8hobqLF_jqZusqRdyoum1zdl9w&usqp=CAU"),
  CategoiresModel("Toy", "Cat_Toy",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSMvSWaEBy_-uLP1Vhhw9nXUzxoqxA0L8_nFQ&usqp=CAU"),
  CategoiresModel("Health", "Cat_Health",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRo_4LRC-7I2eMWORaDo_PXKNbxZpFG9aXH18Ys9-DebKszpo4kenH6Sqh72yF185RtmQs&usqp=CAU"),
  CategoiresModel("Accessories", "Cat_Accessories",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTSbtrdbqNTLWUwXMo16wAT_8dYYC9ujbqSKSrRAy7PtdtoiPgzc4NXj59IPn9t32GRKhg&usqp=CAU"),
];

List<SubCategoriesModel> dummySubCategoires = [
  SubCategoriesModel("Topwear", "sub_topwear", [
    "Cat_Men",
    "Cat_Women",
    "Cat_Kids",
  ]),
  SubCategoriesModel("Footwear", "sub_footwear", [
    "Cat_Men",
    "Cat_Women",
    "Cat_Kids",
  ]),
  SubCategoriesModel("Bottomwear", "sub_bottomwear", [
    "Cat_Men",
    "Cat_Women",
    "Cat_Kids",
  ]),
  SubCategoriesModel(
    "Infant 0-2 Years",
    "sub_kids+1",
    ["Cat_Toy"],
  ),
  SubCategoriesModel(
    "Boy & Girls 3+ Years",
    "sub_kids+3",
    ["Cat_Toy"],
  ),
  SubCategoriesModel("Personal Care", "sub_personal_care", ["Cat_Health"]),
  SubCategoriesModel(
      "Men Accessories", "sub_men_accessories", ["Cat_Accessories"]),
  SubCategoriesModel(
      "Women Accessories", "sub_women_accessories", ["Cat_Accessories"]),
];

List<ProductModel> dummyProductList = [
  // men
  ProductModel(
      "Shirt",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR7mIL1bqKDkhRiryo-JTre3KKOMlDOvDm8_X96Bz25i990IZWLTFAJklKF3STVhSE6UF8&usqp=CAU",
      "Cat_Men",
      "sub_topwear",
      ["112", "113", "114", "115", "116", "117", "118", "119", "120"]),
  ProductModel(
      "T-Shirt",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSrVPV0maJGC_uSkNDJrWSxebA41IuP99ovk6g1UWRppoWpstRbAwQpKfe6GCIv7jbNBc4&usqp=CAU",
      "Cat_Men",
      "sub_topwear",
      ["112", "113", "114", "115", "116", "117", "118", "119", "120"]),
  ProductModel(
      "Trouser",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR2sggyVDzzn-F_wQAmDI3e2zco53Zyb8FMetsr4Fp23rrkmXQoZUaybaog1t1O9-Ms1ug&usqp=CAU",
      "Cat_Men",
      "sub_bottomwear",
      ["112", "113", "114", "115", "116", "117", "118", "119", "120"]),
  ProductModel(
      "Jeans",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQxHMqodRwv7L9zMxWVKOyDyD-uzWs8g8-LfuPLTdUoU9ESooNnBMKKTBZLoCe40uqsC-Q&usqp=CAU",
      "Cat_Men",
      "sub_bottomwear",
      ["112", "113", "114", "115", "116", "117", "118", "119", "120"]),
  ProductModel(
      "Shoes",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS8qL4EEGagDo-DGOalEZTjQ9DkO98xzoftJ9PeSrFBfHeGFsUgnx5j8lD_4o9uaZ7IHRs&usqp=CAU",
      "Cat_Men",
      "sub_footwear",
      ["112", "113", "114", "115", "116", "117", "118", "119", "120"]),
  ProductModel(
      "Sleeper",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQrCQJCr9xhQBJ22cdaodKlkSPVmuJFXxXy7Ku9SP3NeoXAtButLHv5fSh17HRh_AhLM1s&usqp=CAU",
      "Cat_Men",
      "sub_footwear",
      ["112", "113", "114", "115", "116", "117", "118", "119", "120"]),

  // women

  ProductModel(
      "T-Shirt",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzYvPEEZTI-ydD_sDFC_QkY6_ehQjIX6SbzWCswuRbiIcj85FZWJSDoOz8KW2mIXYKeaU&usqp=CAU",
      "Cat_Kids",
      "sub_topwear",
      ["112", "113", "114", "115", "116", "117", "118", "119", "120"]),
  ProductModel(
      "Dresses",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSiSCEXlWnRdepU2C9MfstLhHH8jll5bwH___F9CxeWSfIOEt-Wgu7wImy4O7gPOLqYgwg&usqp=CAU",
      "Cat_Kids",
      "sub_topwear",
      ["112", "113", "114", "115", "116", "117", "118", "119", "120"]),
  ProductModel(
      "Jeans",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcScy5BzYMkE-lUW_n-r8x1j5hCxfeTr0v99_iQgqsAwlqDMA7S9AeOOqmJCHn9iaw1dqRM&usqp=CAU",
      "Cat_Kids",
      "sub_bottomwear",
      ["112", "113", "114", "115", "116", "117", "118", "119", "120"]),
  ProductModel(
      "Leggings",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRwzZhCKbJt6UvTQaZ996Xp1H7aEm9FyGQiFRX88PP9q9KSGC0IhM_z6Wj3okFT-tN-vxI&usqp=CAU",
      "Cat_Kids",
      "sub_bottomwear",
      ["112", "113", "114", "115", "116", "117", "118", "119", "120"]),
  ProductModel(
      "Shoes",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTprlZT7AMXsR5D3LAFFEU9ZkxcHbfdQk8mSSytECEdOY3W6joaE7g8KmMJ9vNavbt3LvM&usqp=CAU",
      "Cat_Kids",
      "sub_footwear",
      ["112", "113", "114", "115", "116", "117", "118", "119", "120"]),
  ProductModel(
      "Sandal",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSgHIzIpqxuXsAtmV_OsZWHrF3a60s6S1M2XXuypwqUZvRNSav6zwcJc89S2jc6KyhsQ9s&usqp=CAU",
      "Cat_Kids",
      "sub_footwear",
      ["112", "113", "114", "115", "116", "117", "118", "119", "120"]),

  // kids

  ProductModel(
      "T-Shirt",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ_oMLERAQ7hCzlZWKBfTAeFj5NHFT62Jyn5Y2ZauVx6q_dLrGFFmPIue71KzdoSfZkGAc&usqp=CAU",
      "Cat_Women",
      "sub_topwear",
      ["112", "113", "114", "115", "116", "117", "118", "119", "120"]),
  ProductModel(
      "Night Dress",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRwjV93jv-h8irLHJKdhA_Os6DVF6bMX0afqtbF51LfoweAkYTPMWi1-LtHIr9nJxSkU68&usqp=CAU",
      "Cat_Women",
      "sub_topwear",
      ["112", "113", "114", "115", "116", "117", "118", "119", "120"]),
  ProductModel(
      "Jeans",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRopaGEjDL5Z75AL8xvs9K1J8_VaJvaNKC_NXZuGRzOQ8568ZnIEj9hu4PC_7lKJ-rJ20M&usqp=CAU",
      "Cat_Women",
      "sub_bottomwear",
      ["112", "113", "114", "115", "116", "117", "118", "119", "120"]),
  ProductModel(
      "Leggings",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTtJMuYrdypvKwaeob1ajMbTPJSdTkH8xNquMefQ-B1dgp1WWxFYeLxG-ZLD-4xyVbsg88&usqp=CAU",
      "Cat_Women",
      "sub_bottomwear",
      ["112", "113", "114", "115", "116", "117", "118", "119", "120"]),
  ProductModel(
      "Sleeper",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRFt_vpjVrmhP4EOdimUwFDOJt4UVxOrHEtZCBUViSx7yUNogGKxmw6EwebpMhG9M5qn8U&usqp=CAU",
      "Cat_Women",
      "sub_footwear",
      ["112", "113", "114", "115", "116", "117", "118", "119", "120"]),
  ProductModel(
      "Sandal",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgWW4l0E3awaz0KkgQ1Wn3qSUVOAdz8NcZ4Y4QhyjsrTmdwvcWgr6sLl9TwhVLDIQQDZQ&usqp=CAU",
      "Cat_Women",
      "sub_footwear",
      ["112", "113", "114", "115", "116", "117", "118", "119", "120"]),

  // toy
  ProductModel(
      "Soft Toyes",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQscoITz7lDXeNtiSKCXsb-dYA9KZe2QiODOlnYBgKi2TVX2BSSy9bedxP2GyGS5dTyAJ4&usqp=CAU",
      "Cat_Toy",
      "sub_kids+1",
      ["112", "113", "114", "115", "116", "117", "118", "119", "120"]),
  ProductModel(
      "Kids Watches",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSfrHDua3mWtdukKDY5hA3VihZ-cegwfs2t27fnw0H4O3CCbrKd7dmAQvmwpuAxoVz7t1U&usqp=CAU",
      "Cat_Toy",
      "sub_kids+1",
      ["112", "113", "114", "115", "116", "117", "118", "119", "120"]),
  ProductModel(
      "Stationerys",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRu5KRJ-853rCy84Slv8XZFHHE-WPqTUcro4sOqXCtBHbKpUBB4ZEErAPS9q8cP_QQemfg&usqp=CAU",
      "Cat_Toy",
      "sub_kids+3",
      ["112", "113", "114", "115", "116", "117", "118", "119", "120"]),
  ProductModel(
      "Bags",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRQixwWR9bSAeW-Rvqi37SOyFVrmlZ9nbDUZ82mGL2HlMriXZ3TJ954Thy2Tx-fzsNg49I&usqp=CAU",
      "Cat_Toy",
      "sub_kids+3",
      ["112", "113", "114", "115", "116", "117", "118", "119", "120"]),

  // healts
  ProductModel(
      "Oils",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTsI_VEP-CKk8YwpPb9tys2ZZ-2Eqz5hPIqJ5n1MKBRBRPWPbn1Xz0z1beW3zJekeAIB6A&usqp=CAU",
      "Cat_Health",
      "sub_personal_care",
      ["112", "113", "114", "115", "116", "117", "118", "119", "120"]),
  ProductModel(
      "Makeup",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTnSNydaTYOLce1hlZn81P8bdv0QPeK_Ka8VeMxN-cXVlkHrml7ZAiB2U5UUkV3zBQcmQM&usqp=CAU",
      "Cat_Health",
      "sub_personal_care",
      ["112", "113", "114", "115", "116", "117", "118", "119", "120"]),
  ProductModel(
      "Trimmers",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQWYfFkK2ExXGhKnNnqmPgC8G9a5Qv9rQuXhev4c9X_BDMK3LXLDq9Kfi7bOnHW5Zr2OBQ&usqp=CAU",
      "Cat_Health",
      "sub_personal_care",
      ["112", "113", "114", "115", "116", "117", "118", "119", "120"]),

  // Accessories
  ProductModel(
      "Belts",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRIxMlNmqqT8GEeAzvIs7vHc9LqmqrucO7cpTw9NnC1Oqhs_L0x6HKlKPOcdroUS11givU&usqp=CAU",
      "sub_men_accessories",
      "Cat_Accessories",
      ["112", "113", "114", "115", "116", "117", "118", "119", "120"]),
  ProductModel(
      "Watches",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQhQi7T9Sd-YYDQzAE9oXygPy7SjIRwtiFbYewGW86PpDIm2_5-Ob8Zv3B8bFXdJfGbNBQ&usqp=CAU",
      "sub_men_accessories",
      "Cat_Accessories",
      ["112", "113", "114", "115", "116", "117", "118", "119", "120"]),
  ProductModel(
      "Wallets",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSPOEXMS72pC7PXGJOeZzS7Li_ASK4nH4-53beum_rL17DAKcAqbfuDF_PYifGLeWnsRUg&usqp=CAU",
      "sub_women_accessories",
      "Cat_Accessories",
      ["112", "113", "114", "115", "116", "117", "118", "119", "120"]),
  ProductModel(
      "Sunglasses",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSyuzp8QclSXamyRiys06OqNlq0N0ogMrOLlr620zW6j6wunVcA4bYhQSjmZ37TOxtZ4EQ&usqp=CAU",
      "sub_women_accessories",
      "Cat_Accessories",
      ["112", "113", "114", "115", "116", "117", "118", "119", "120"]),
];

List categories = [
  {
    "Cat_title": "MEN",
    "Cat_id": "Cat_Men",
    "image":
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTewT9Vy_oXNqPfsYtGUEMvKYpPSWssE07c3w&usqp=CAU"
  },
  {
    "Cat_title": "WOMEN",
    "Cat_id": "Cat_Women",
    "image":
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJFDnEkflCwHxA8MlLbcEY6MJxd3rdjf1m8w&usqp=CAU"
  },
  {
    "Cat_title": "KIDS",
    "Cat_id": "Cat_Kids",
    "image":
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ00iIpXnbI8hobqLF_jqZusqRdyoum1zdl9w&usqp=CAU"
  }
];

List subCategories = [
  {
    "SubCat_title": "Bottomwear",
    "SubCat_id": "Men_Bottomwear",
    "Cat_id": ["Cat_Kids", "Cat_Women"]
  },
  {
    "SubCat_title": "Topwear",
    "SubCat_id": "Women_Topwear",
    "Cat_id": ["Cat_Men", "Cat_Kids"]
  },
  {
    "SubCat_title": "Footwear",
    "SubCat_id": "Kids_Footwear",
    "Cat_id": ["Cat_Women", "Cat_Men"]
  }
];

List productsCategoires = [
  {
    "id": "Men6_watch",
  }
];

List dummyitems = [
  {
    "id": "1",
    "name": "Shoes",
    "price": "200",
    "tag": ["shoes", "boy shoes"],
    "image":
        "https://images.unsplash.com/photo-1542291026-7eec264c27ff?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8c2hvZXN8ZW58MHx8MHx8fDA%3D&w=1000&q=80",
    "fav": false,
    "type": "Shoes",
    "SubCat_id": ["Men_Bottomwear", "Kids_Footwear"],
  },
  {
    "id": "2",
    "name": "Shirt",
    "price": "100",
    "tag": ["shoes", "boy shoes"],
    "image":
        "https://images.meesho.com/images/products/107782489/zmq6b_512.webp",
    "fav": false,
    "type": "Shirt",
    "SubCat_id": ["Women_Topwear", "Kids_Footwear"],
  },
  {
    "id": "3",
    "name": "T-Shirt",
    "price": "100",
    "tag": ["shoes", "boy shoes"],
    "image":
        "https://www.beyoung.in/api/cache/catalog/products/printed_t-shirt_girl_final_16_9_2022/hungry_panda_rose_pink_t-shirt_for_girls_base_700x933.jpg",
    "fav": false,
    "type": "TShirt",
    "SubCat_id": ["Men_Bottomwear", "Kids_Footwear"],
  },
  {
    "id": "4",
    "name": "Watch",
    "price": "100",
    "tag": ["shoes", "boy shoes"],
    "image":
        "https://www.soosi.co.in/cdn/shop/products/WhatsAppImage2023-03-25at1.32.38AM_580x.jpg?v=1679739030",
    "fav": false,
    "type": "Watch",
    "SubCat_id": ["Men_Bottomwear", "Women_Topwear", "Kids_Footwear"],
  },
  {
    "id": "5",
    "name": "Shoes",
    "price": "100",
    "tag": ["shoes", "boy shoes"],
    "image":
        "https://5.imimg.com/data5/ANDROID/Default/2021/6/HL/IO/VG/129039116/product-jpeg-500x500.jpg",
    "fav": false,
    "type": "Women Shoes",
    "SubCat_id": ["Men_Bottomwear", "Kids_Footwear"],
  }
];

List weeklyItems = [
  {
    "sale": "10",
    "type": "Min",
    "image": dummyitems[1]["image"],
    "product": "Saree",
  },
  {
    "sale": "20",
    "type": "Flat",
    "image": dummyitems[1]["image"],
    "product": "Tops",
  },
  {
    "sale": "35",
    "type": "Min",
    "image": dummyitems[1]["image"],
    "product": "Footwear",
  },
  {
    "sale": "35",
    "type": "Min",
    "image": dummyitems[1]["image"],
    "product": "Tops",
  },
  {
    "sale": "35",
    "type": "Min",
    "image": dummyitems[1]["image"],
    "product": "Jeans",
  }
];

List topAnimalFeed = [
  {"img": TopDealItems.khal, "name": "Khal", "discount": 25, "type": "Min"},
  {
    "img": TopDealItems.binola,
    "name": "Binola",
    "discount": 15,
    "type": "Upto"
  },
  {
    "img": TopDealItems.anaj,
    "name": "Sabut Anaj",
    "discount": 10,
    "type": "Min"
  },
  {
    "img": TopDealItems.oil,
    "name": "Oil and Ghee",
    "discount": 12,
    "type": "Upto"
  },
];

List allAddressDummyData = [];

List availablepincodes = [
  125033,
  125003,
  125001,
  125002,
  125003,
];

List<ReviewModel> availableReview = [
  ReviewModel(
      username: "Vikrant",
      productId: "",
      rating: 4,
      time: DateTime.now().toIso8601String(),
      discription:
          "Best Quality of Sandle | Campus Sandal is Very Very good Product 👌👌👌 | And Fast Delivery 🚚🙏 Thanks for Flipkart | Price is better | Campus Quality is very very best And good quality Product ||||"),
  ReviewModel(
      username: "Vikrant",
      productId: "",
      rating: 1,
      time: DateTime.now().toIso8601String(),
      discription:
          "Best Quality of Sandle | Campus Sandal is Very Very good Product 👌👌👌 | And Fast Delivery 🚚🙏 Thanks for Flipkart | Price is better | Campus Quality is very very best And good quality Product ||||"),
  ReviewModel(
      username: "Vikrant",
      productId: "",
      rating: 2,
      time: DateTime.now().toIso8601String(),
      discription:
          "Best Quality of Sandle | Campus Sandal is Very Very good Product 👌👌👌 | And Fast Delivery 🚚🙏 Thanks for Flipkart | Price is better | Campus Quality is very very best And good quality Product ||||"),
  ReviewModel(
      username: "Vikrant",
      productId: "",
      rating: 1.5,
      time: DateTime.now().toIso8601String(),
      discription: "amazing product"),
  ReviewModel(
      username: "Vikrant",
      productId: "",
      rating: 2.5,
      time: DateTime.now().toIso8601String(),
      discription: "amazing product"),
  ReviewModel(
      username: "Vikrant",
      productId: "",
      rating: 1.5,
      time: DateTime.now().toIso8601String(),
      discription: "amazing product"),
  ReviewModel(
      username: "Vikrant",
      productId: "",
      rating: 2.5,
      time: DateTime.now().toIso8601String(),
      discription: "amazing product"),
  ReviewModel(
      username: "Vikrant",
      productId: "",
      rating: 3,
      time: DateTime.now().toIso8601String(),
      discription: "amazing product"),
  ReviewModel(
      username: "Vikrant",
      productId: "",
      rating: 3,
      time: DateTime.now().toIso8601String(),
      discription: "amazing product"),
  ReviewModel(
      username: "Vikrant",
      productId: "",
      rating: 4,
      time: DateTime.now().toIso8601String(),
      discription: "amazing product"),
  ReviewModel(
      username: "Vikrant",
      productId: "",
      rating: 4.5,
      time: DateTime.now().toIso8601String(),
      discription: "amazing product"),
  ReviewModel(
      username: "Vikrant",
      productId: "",
      rating: 5,
      time: DateTime.now().toIso8601String(),
      discription: "amazing product"),
  ReviewModel(
      username: "Vikrant",
      productId: "",
      rating: 5,
      time: DateTime.now().toIso8601String(),
      discription: "amazing product"),
  ReviewModel(
      username: "Vikrant",
      productId: "",
      rating: 4,
      time: DateTime.now().toIso8601String(),
      discription: "amazing product"),
  ReviewModel(
      username: "Vikrant",
      productId: "",
      rating: 3,
      time: DateTime.now().toIso8601String(),
      discription: "amazing product"),
  ReviewModel(
      username: "Vikrant",
      productId: "",
      rating: 3,
      time: DateTime.now().toIso8601String(),
      discription: "amazing product"),
  ReviewModel(
      username: "Vikrant",
      productId: "",
      rating: 2.5,
      time: DateTime.now().toIso8601String(),
      discription: "amazing product"),
];

List<ItemModel> dummyitemList = [
  ItemModel(
    "Stylish Casual T-Shirt",
    "Lorem ipsum dolor sit amet consectetur. Aliquam phasellus nunc nunc mauris metus et diam vulputate odio. Pharetra nunc urna pulvinar at arcu habitasse dictum purus. Tortor vitae blandit lacus erat.",
    "Lorem ipsum dolor sit amet consectetur. Est aliquam nisl at in sed adipiscing. Id volutpat quis cursus convallis aliquam. Nec pretium amet in nec pulvinar sed aenean amet. Ullamcorper ipsum nunc dui nibh enim gravida cras nunc. Consequat id laoreet.",
    "202",
    "112",
    500,
    400,
    false,
    [
      "https://images.meesho.com/images/products/107782489/zmq6b_512.webp",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT8LxNejO5j0b_YV8ndS3Fvk2kEPY_iAACBym6XxT-uyeu1zC_vDDSkJwwQM-aQoE0eAY8&usqp=CAU",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTeGBSCoKFpNFXz0r9OAmbjytgYGHwX3TtmwYhLFuIzCHP5eM3DLiJ_jLg_N1kAV7anQsA&usqp=CAU",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcST5qbDzfV8BysArMdd5kxvuOXzenByVjjoEe1jr60iiLwxYscb_pLM_V5qNOwGbxijLrU&usqp=CAU"
    ],
    [
      ItemSizeModel("S", 400),
      ItemSizeModel("M", 420),
      ItemSizeModel("L", 440),
    ],
  ),
  ItemModel(
    "Stylish Casual T-Shirt",
    "Lorem ipsum dolor sit amet consectetur. Aliquam phasellus nunc nunc mauris metus et diam vulputate odio. Pharetra nunc urna pulvinar at arcu habitasse dictum purus. Tortor vitae blandit lacus erat.",
    "Lorem ipsum dolor sit amet consectetur. Est aliquam nisl at in sed adipiscing. Id volutpat quis cursus convallis aliquam. Nec pretium amet in nec pulvinar sed aenean amet. Ullamcorper ipsum nunc dui nibh enim gravida cras nunc. Consequat id laoreet.",
    "202",
    "113",
    500,
    400,
    false,
    [
      "https://www.beyoung.in/api/cache/catalog/products/printed_t-shirt_girl_final_16_9_2022/hungry_panda_rose_pink_t-shirt_for_girls_base_700x933.jpg",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT8LxNejO5j0b_YV8ndS3Fvk2kEPY_iAACBym6XxT-uyeu1zC_vDDSkJwwQM-aQoE0eAY8&usqp=CAU",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTeGBSCoKFpNFXz0r9OAmbjytgYGHwX3TtmwYhLFuIzCHP5eM3DLiJ_jLg_N1kAV7anQsA&usqp=CAU",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcST5qbDzfV8BysArMdd5kxvuOXzenByVjjoEe1jr60iiLwxYscb_pLM_V5qNOwGbxijLrU&usqp=CAU"
    ],
    [
      ItemSizeModel("S", 400),
      ItemSizeModel("M", 420),
      ItemSizeModel("L", 440),
    ],
  ),
  ItemModel(
    "Stylish Casual T-Shirt",
    "Lorem ipsum dolor sit amet consectetur. Aliquam phasellus nunc nunc mauris metus et diam vulputate odio. Pharetra nunc urna pulvinar at arcu habitasse dictum purus. Tortor vitae blandit lacus erat.",
    "Lorem ipsum dolor sit amet consectetur. Est aliquam nisl at in sed adipiscing. Id volutpat quis cursus convallis aliquam. Nec pretium amet in nec pulvinar sed aenean amet. Ullamcorper ipsum nunc dui nibh enim gravida cras nunc. Consequat id laoreet.",
    "202",
    "114",
    500,
    400,
    false,
    [
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJvT-auylbVWmoWHFstLE7JJX17KwHFbkxALfUgpvITYRDo6xEw2lw60rJYhgQaqSWbCU&usqp=CAU",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT8LxNejO5j0b_YV8ndS3Fvk2kEPY_iAACBym6XxT-uyeu1zC_vDDSkJwwQM-aQoE0eAY8&usqp=CAU",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTeGBSCoKFpNFXz0r9OAmbjytgYGHwX3TtmwYhLFuIzCHP5eM3DLiJ_jLg_N1kAV7anQsA&usqp=CAU",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcST5qbDzfV8BysArMdd5kxvuOXzenByVjjoEe1jr60iiLwxYscb_pLM_V5qNOwGbxijLrU&usqp=CAU"
    ],
    [
      ItemSizeModel("S", 400),
      ItemSizeModel("M", 420),
      ItemSizeModel("L", 440),
    ],
  ),
  ItemModel(
    "Stylish Casual T-Shirt",
    "Lorem ipsum dolor sit amet consectetur. Aliquam phasellus nunc nunc mauris metus et diam vulputate odio. Pharetra nunc urna pulvinar at arcu habitasse dictum purus. Tortor vitae blandit lacus erat.",
    "Lorem ipsum dolor sit amet consectetur. Est aliquam nisl at in sed adipiscing. Id volutpat quis cursus convallis aliquam. Nec pretium amet in nec pulvinar sed aenean amet. Ullamcorper ipsum nunc dui nibh enim gravida cras nunc. Consequat id laoreet.",
    "202",
    "115",
    500,
    400,
    false,
    [
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJvT-auylbVWmoWHFstLE7JJX17KwHFbkxALfUgpvITYRDo6xEw2lw60rJYhgQaqSWbCU&usqp=CAU",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT8LxNejO5j0b_YV8ndS3Fvk2kEPY_iAACBym6XxT-uyeu1zC_vDDSkJwwQM-aQoE0eAY8&usqp=CAU",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTeGBSCoKFpNFXz0r9OAmbjytgYGHwX3TtmwYhLFuIzCHP5eM3DLiJ_jLg_N1kAV7anQsA&usqp=CAU",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcST5qbDzfV8BysArMdd5kxvuOXzenByVjjoEe1jr60iiLwxYscb_pLM_V5qNOwGbxijLrU&usqp=CAU"
    ],
    [
      ItemSizeModel("S", 400),
      ItemSizeModel("M", 420),
      ItemSizeModel("L", 440),
    ],
  ),
  ItemModel(
    "Stylish Casual T-Shirt",
    "Lorem ipsum dolor sit amet consectetur. Aliquam phasellus nunc nunc mauris metus et diam vulputate odio. Pharetra nunc urna pulvinar at arcu habitasse dictum purus. Tortor vitae blandit lacus erat.",
    "Lorem ipsum dolor sit amet consectetur. Est aliquam nisl at in sed adipiscing. Id volutpat quis cursus convallis aliquam. Nec pretium amet in nec pulvinar sed aenean amet. Ullamcorper ipsum nunc dui nibh enim gravida cras nunc. Consequat id laoreet.",
    "202",
    "116",
    500,
    400,
    false,
    [
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJvT-auylbVWmoWHFstLE7JJX17KwHFbkxALfUgpvITYRDo6xEw2lw60rJYhgQaqSWbCU&usqp=CAU",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT8LxNejO5j0b_YV8ndS3Fvk2kEPY_iAACBym6XxT-uyeu1zC_vDDSkJwwQM-aQoE0eAY8&usqp=CAU",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTeGBSCoKFpNFXz0r9OAmbjytgYGHwX3TtmwYhLFuIzCHP5eM3DLiJ_jLg_N1kAV7anQsA&usqp=CAU",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcST5qbDzfV8BysArMdd5kxvuOXzenByVjjoEe1jr60iiLwxYscb_pLM_V5qNOwGbxijLrU&usqp=CAU"
    ],
    [
      ItemSizeModel("S", 400),
      ItemSizeModel("M", 420),
      ItemSizeModel("L", 440),
    ],
  ),
  ItemModel(
    "Stylish Casual T-Shirt",
    "Lorem ipsum dolor sit amet consectetur. Aliquam phasellus nunc nunc mauris metus et diam vulputate odio. Pharetra nunc urna pulvinar at arcu habitasse dictum purus. Tortor vitae blandit lacus erat.",
    "Lorem ipsum dolor sit amet consectetur. Est aliquam nisl at in sed adipiscing. Id volutpat quis cursus convallis aliquam. Nec pretium amet in nec pulvinar sed aenean amet. Ullamcorper ipsum nunc dui nibh enim gravida cras nunc. Consequat id laoreet.",
    "202",
    "117",
    500,
    400,
    false,
    [
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJvT-auylbVWmoWHFstLE7JJX17KwHFbkxALfUgpvITYRDo6xEw2lw60rJYhgQaqSWbCU&usqp=CAU",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT8LxNejO5j0b_YV8ndS3Fvk2kEPY_iAACBym6XxT-uyeu1zC_vDDSkJwwQM-aQoE0eAY8&usqp=CAU",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTeGBSCoKFpNFXz0r9OAmbjytgYGHwX3TtmwYhLFuIzCHP5eM3DLiJ_jLg_N1kAV7anQsA&usqp=CAU",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcST5qbDzfV8BysArMdd5kxvuOXzenByVjjoEe1jr60iiLwxYscb_pLM_V5qNOwGbxijLrU&usqp=CAU"
    ],
    [
      ItemSizeModel("S", 400),
      ItemSizeModel("M", 420),
      ItemSizeModel("L", 440),
    ],
  ),
  ItemModel(
    "Stylish Casual T-Shirt",
    "Lorem ipsum dolor sit amet consectetur. Aliquam phasellus nunc nunc mauris metus et diam vulputate odio. Pharetra nunc urna pulvinar at arcu habitasse dictum purus. Tortor vitae blandit lacus erat.",
    "Lorem ipsum dolor sit amet consectetur. Est aliquam nisl at in sed adipiscing. Id volutpat quis cursus convallis aliquam. Nec pretium amet in nec pulvinar sed aenean amet. Ullamcorper ipsum nunc dui nibh enim gravida cras nunc. Consequat id laoreet.",
    "202",
    "118",
    500,
    400,
    false,
    [
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJvT-auylbVWmoWHFstLE7JJX17KwHFbkxALfUgpvITYRDo6xEw2lw60rJYhgQaqSWbCU&usqp=CAU",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT8LxNejO5j0b_YV8ndS3Fvk2kEPY_iAACBym6XxT-uyeu1zC_vDDSkJwwQM-aQoE0eAY8&usqp=CAU",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTeGBSCoKFpNFXz0r9OAmbjytgYGHwX3TtmwYhLFuIzCHP5eM3DLiJ_jLg_N1kAV7anQsA&usqp=CAU",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcST5qbDzfV8BysArMdd5kxvuOXzenByVjjoEe1jr60iiLwxYscb_pLM_V5qNOwGbxijLrU&usqp=CAU"
    ],
    [
      ItemSizeModel("S", 400),
      ItemSizeModel("M", 420),
      ItemSizeModel("L", 440),
    ],
  ),
  ItemModel(
    "Stylish Casual T-Shirt",
    "Lorem ipsum dolor sit amet consectetur. Aliquam phasellus nunc nunc mauris metus et diam vulputate odio. Pharetra nunc urna pulvinar at arcu habitasse dictum purus. Tortor vitae blandit lacus erat.",
    "Lorem ipsum dolor sit amet consectetur. Est aliquam nisl at in sed adipiscing. Id volutpat quis cursus convallis aliquam. Nec pretium amet in nec pulvinar sed aenean amet. Ullamcorper ipsum nunc dui nibh enim gravida cras nunc. Consequat id laoreet.",
    "202",
    "119",
    500,
    400,
    false,
    [
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJvT-auylbVWmoWHFstLE7JJX17KwHFbkxALfUgpvITYRDo6xEw2lw60rJYhgQaqSWbCU&usqp=CAU",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT8LxNejO5j0b_YV8ndS3Fvk2kEPY_iAACBym6XxT-uyeu1zC_vDDSkJwwQM-aQoE0eAY8&usqp=CAU",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTeGBSCoKFpNFXz0r9OAmbjytgYGHwX3TtmwYhLFuIzCHP5eM3DLiJ_jLg_N1kAV7anQsA&usqp=CAU",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcST5qbDzfV8BysArMdd5kxvuOXzenByVjjoEe1jr60iiLwxYscb_pLM_V5qNOwGbxijLrU&usqp=CAU"
    ],
    [
      ItemSizeModel("S", 400),
      ItemSizeModel("M", 420),
      ItemSizeModel("L", 440),
    ],
  ),
  ItemModel(
    "Stylish Casual T-Shirt",
    "Lorem ipsum dolor sit amet consectetur. Aliquam phasellus nunc nunc mauris metus et diam vulputate odio. Pharetra nunc urna pulvinar at arcu habitasse dictum purus. Tortor vitae blandit lacus erat.",
    "Lorem ipsum dolor sit amet consectetur. Est aliquam nisl at in sed adipiscing. Id volutpat quis cursus convallis aliquam. Nec pretium amet in nec pulvinar sed aenean amet. Ullamcorper ipsum nunc dui nibh enim gravida cras nunc. Consequat id laoreet.",
    "202",
    "120",
    500,
    400,
    false,
    [
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJvT-auylbVWmoWHFstLE7JJX17KwHFbkxALfUgpvITYRDo6xEw2lw60rJYhgQaqSWbCU&usqp=CAU",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT8LxNejO5j0b_YV8ndS3Fvk2kEPY_iAACBym6XxT-uyeu1zC_vDDSkJwwQM-aQoE0eAY8&usqp=CAU",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTeGBSCoKFpNFXz0r9OAmbjytgYGHwX3TtmwYhLFuIzCHP5eM3DLiJ_jLg_N1kAV7anQsA&usqp=CAU",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcST5qbDzfV8BysArMdd5kxvuOXzenByVjjoEe1jr60iiLwxYscb_pLM_V5qNOwGbxijLrU&usqp=CAU"
    ],
    [
      ItemSizeModel("S", 400),
      ItemSizeModel("M", 420),
      ItemSizeModel("L", 440),
    ],
  ),
  ItemModel(
    "Stylish Casual T-Shirt",
    "Lorem ipsum dolor sit amet consectetur. Aliquam phasellus nunc nunc mauris metus et diam vulputate odio. Pharetra nunc urna pulvinar at arcu habitasse dictum purus. Tortor vitae blandit lacus erat.",
    "Lorem ipsum dolor sit amet consectetur. Est aliquam nisl at in sed adipiscing. Id volutpat quis cursus convallis aliquam. Nec pretium amet in nec pulvinar sed aenean amet. Ullamcorper ipsum nunc dui nibh enim gravida cras nunc. Consequat id laoreet.",
    "202",
    "121",
    500,
    400,
    false,
    [
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJvT-auylbVWmoWHFstLE7JJX17KwHFbkxALfUgpvITYRDo6xEw2lw60rJYhgQaqSWbCU&usqp=CAU",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT8LxNejO5j0b_YV8ndS3Fvk2kEPY_iAACBym6XxT-uyeu1zC_vDDSkJwwQM-aQoE0eAY8&usqp=CAU",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTeGBSCoKFpNFXz0r9OAmbjytgYGHwX3TtmwYhLFuIzCHP5eM3DLiJ_jLg_N1kAV7anQsA&usqp=CAU",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcST5qbDzfV8BysArMdd5kxvuOXzenByVjjoEe1jr60iiLwxYscb_pLM_V5qNOwGbxijLrU&usqp=CAU"
    ],
    [
      ItemSizeModel("S", 400),
      ItemSizeModel("M", 420),
      ItemSizeModel("L", 440),
    ],
  ),
  ItemModel(
    "Stylish Casual T-Shirt",
    "Lorem ipsum dolor sit amet consectetur. Aliquam phasellus nunc nunc mauris metus et diam vulputate odio. Pharetra nunc urna pulvinar at arcu habitasse dictum purus. Tortor vitae blandit lacus erat.",
    "Lorem ipsum dolor sit amet consectetur. Est aliquam nisl at in sed adipiscing. Id volutpat quis cursus convallis aliquam. Nec pretium amet in nec pulvinar sed aenean amet. Ullamcorper ipsum nunc dui nibh enim gravida cras nunc. Consequat id laoreet.",
    "202",
    "122",
    500,
    400,
    false,
    [
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJvT-auylbVWmoWHFstLE7JJX17KwHFbkxALfUgpvITYRDo6xEw2lw60rJYhgQaqSWbCU&usqp=CAU",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT8LxNejO5j0b_YV8ndS3Fvk2kEPY_iAACBym6XxT-uyeu1zC_vDDSkJwwQM-aQoE0eAY8&usqp=CAU",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTeGBSCoKFpNFXz0r9OAmbjytgYGHwX3TtmwYhLFuIzCHP5eM3DLiJ_jLg_N1kAV7anQsA&usqp=CAU",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcST5qbDzfV8BysArMdd5kxvuOXzenByVjjoEe1jr60iiLwxYscb_pLM_V5qNOwGbxijLrU&usqp=CAU"
    ],
    [
      ItemSizeModel("S", 400),
      ItemSizeModel("M", 420),
      ItemSizeModel("L", 440),
    ],
  ),
];
