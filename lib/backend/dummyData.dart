
// ignore: unused_import
import 'package:flutter/material.dart';

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

List categories = [
 
  {
    "Cat_title": "MEN",
    "Cat_id": "Cat_Men",
    "image" : "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTewT9Vy_oXNqPfsYtGUEMvKYpPSWssE07c3w&usqp=CAU"
  },
  {
    "Cat_title": "WOMEN",
    "Cat_id": "Cat_Women",
    "image" :"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJFDnEkflCwHxA8MlLbcEY6MJxd3rdjf1m8w&usqp=CAU"
  },
  {
    "Cat_title": "KIDS",
    "Cat_id": "Cat_Kids",
    "image":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ00iIpXnbI8hobqLF_jqZusqRdyoum1zdl9w&usqp=CAU"
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
    "id" :"Men6_watch",
    




  
  }
];
  


List dummyitems = 
[
  {
    "id": "1",
    "name": "Shoes",
    "price": "200",
    "tag": [ "shoes", "boy shoes"],
    "image":
        "https://images.unsplash.com/photo-1542291026-7eec264c27ff?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8c2hvZXN8ZW58MHx8MHx8fDA%3D&w=1000&q=80",
    "fav": false,
    "type" : "Shoes",
    "SubCat_id": [
      "Men_Bottomwear","Kids_Footwear"
    ],
  },
  {
    "id": "2",
    "name": "Shirt",
    "price": "100",
        "tag": [ "shoes", "boy shoes"],

    "image":
        "https://images.meesho.com/images/products/107782489/zmq6b_512.webp",
    "fav": false,
    "type" : "Shirt",
        "SubCat_id": [
      "Women_Topwear","Kids_Footwear"
    ],
  },
  {
    "id": "3",
    "name": "T-Shirt",
    "price": "100",
        "tag": [ "shoes", "boy shoes"],

    "image":
        "https://www.beyoung.in/api/cache/catalog/products/printed_t-shirt_girl_final_16_9_2022/hungry_panda_rose_pink_t-shirt_for_girls_base_700x933.jpg",
    "fav": false,
    "type" : "TShirt",
        "SubCat_id": [
      "Men_Bottomwear","Kids_Footwear"
    ],
  },
  {
    "id": "4",
    "name": "Watch",
    "price": "100",
        "tag": [ "shoes", "boy shoes"],

    "image":
        "https://www.soosi.co.in/cdn/shop/products/WhatsAppImage2023-03-25at1.32.38AM_580x.jpg?v=1679739030",
    "fav": false,
    "type" : "Watch",
        "SubCat_id": [
      "Men_Bottomwear","Women_Topwear","Kids_Footwear"
    ],
  },
  {
    "id": "5",
    "name": "Shoes",
    "price": "100",
        "tag": [ "shoes", "boy shoes"],

    "image":
        "https://5.imimg.com/data5/ANDROID/Default/2021/6/HL/IO/VG/129039116/product-jpeg-500x500.jpg",
    "fav": false,
    "type" :"Women Shoes",
        "SubCat_id": [
      "Men_Bottomwear","Kids_Footwear"
    ],
  }
];



List weeklyItems = [
  {
    "sale" : "10",
    "type" : "Min",
    "image" : dummyitems[1]["image"],
    "product": "Saree",
  },
    {
    "sale" : "20",
    "type" : "Flat",
    "image" : dummyitems[1]["image"],
    "product": "Tops",

  },
    {
    "sale" : "35",
        "type" : "Min",
    "image" : dummyitems[1]["image"],
        "product": "Footwear",

  },
     {
    "sale" : "35",
        "type" : "Min",
    "image" : dummyitems[1]["image"],
        "product": "Tops",

  }
  ,   {
    "sale" : "35",
        "type" : "Min",
    "image" : dummyitems[1]["image"],
        "product": "Jeans",

  }
  
];