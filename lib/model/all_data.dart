// this data show category list or images on Dashboard
import 'package:cattel_feed/Helper/icon.dart';
import 'package:cattel_feed/model/model.dart';

List<CategoryModel> listofCateogory = [
  CategoryModel("1", "Men",
      "https://upload.wikimedia.org/wikipedia/commons/thumb/4/48/Outdoors-man-portrait_%28cropped%29.jpg/1200px-Outdoors-man-portrait_%28cropped%29.jpg"),
  CategoryModel("2", "Women",
      "https://upload.wikimedia.org/wikipedia/commons/8/86/Woman_at_Lover%27s_Bridge_Tanjung_Sepat_%28cropped%29.jpg"),
  CategoryModel("3", "Kids",
      "https://img.etimg.com/thumb/width-640,height-480,imgsize-304956,resizemode-75,msid-102234855/top-trending-products/health-fitness/exercise-fitness/best-tricycles-for-kids-discover-safe-and-fun-rides-for-your-children/benefits-of-riding-a-tricycle-pre-reading-skill-kids-scaled.jpg"),
  CategoryModel("4", "Kids",
      "https://techgt.com.br/wp-content/uploads/2023/05/hero__w8w7dclctnmi_large.jpg"),
  CategoryModel("5", "Kids",
      "https://b3n8a3n8.rocketcdn.me/wp-content/uploads/2018/03/2018-03-07-33.jpg")
];

// this data show heavy discounts on Dashboard
List<DiscountModel> discountModel = [
  DiscountModel("1", AppImages.discount1),
  DiscountModel("2", AppImages.discount2),
];

// this data show weekly deals

List<WeeklyDealsModel> weeklyDeals = [
  WeeklyDealsModel("1", "Saree",
      "https://5.imimg.com/data5/SELLER/Default/2021/8/YY/IE/JK/113884685/2-500x500.jpeg"),
  WeeklyDealsModel("2", "Tops",
      "https://media.istockphoto.com/id/656530364/photo/be-a-flamingo-in-a-flock-of-pigeons.jpg?s=612x612&w=0&k=20&c=mfh7GioZdjPJz5X1pWLpAbA0HjDxt0eg0gRcwDasCoo="),
  WeeklyDealsModel("3", "Jeans",
      "https://assets.myntassets.com/h_1440,q_100,w_1080/v1/assets/images/19931696/2022/11/22/172a6ec8-1c13-409f-94b4-05041af2c5971669108119508-Louis-Philippe-Jeans-Men-Blue-Slim-Fit-Mid-Rise-Light-Fade-S-1.jpg"),
  WeeklyDealsModel("4", "Footwear",
      "https://images.pexels.com/photos/267301/pexels-photo-267301.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
];

// this data show Kids Garments
List<WeeklyDealsModel> kidsGarment = [
  WeeklyDealsModel("1", "T-shirts",
      "https://ih1.redbubble.net/image.3892699596.8820/ssrco,slim_fit_t_shirt,mens,9ec0d5:0d26d5c715,front,square_product,600x600.jpg"),
  WeeklyDealsModel("2", "Lahenga",
      "https://www.frontierraas.com/pub/media/catalog/product/cache/74910300c4c00f257771c5afa25168a6/f/r/frontier_raas-_lodhi6437.jpg"),
  WeeklyDealsModel("3", "Jeans",
      "https://imagescdn.planetfashion.in/img/app/product/7/795640-9350615.jpg?auto=format"),
  WeeklyDealsModel("4", "Footwear",
      "https://indian-retailer.s3.ap-south-1.amazonaws.com/s3fs-public/2022-06/shooeee.jpg"),
];

// This Data show according to User budget product
List<BudgetStoreModel> budgeStoreModel = [
  BudgetStoreModel("1", "99"),
  BudgetStoreModel("2", "199"),
  BudgetStoreModel("3", "299"),
  BudgetStoreModel("4", "399"),
  BudgetStoreModel("5", "499"),
];

// This data show Mens Product with Budget
List<MensBudgestStoreModel> mensBudgetModel = [
  MensBudgestStoreModel(
      "1",
      "https://m.media-amazon.com/images/I/71UaMLuWKaL._AC_UY1100_.jpg",
      "Tops",
      "299"),
  MensBudgestStoreModel(
      "2",
      "https://assets.ajio.com/medias/sys_master/root/20230624/3aUE/6496b5feeebac147fcfbf041/-473Wx593H-465324974-peach-MODEL.jpg",
      "Shoes",
      "299"),
  MensBudgestStoreModel(
      "3",
      "https://www.shoeperwoman.com/wp-content/uploads/2010/11/Alberto-Guardiani-lipstick-shoes.jpg",
      "Lipsticks",
      "299"),
  MensBudgestStoreModel(
      "4",
      "https://assets.ajio.com/medias/sys_master/root/20230822/ejNx/64e46791ddf77915195d67d3/-473Wx593H-463532274-green-MODEL.jpg",
      "Saree",
      "299"),
  MensBudgestStoreModel(
      "5",
      "https://m.media-amazon.com/images/I/71UaMLuWKaL._AC_UY1100_.jpg",
      "Accessories",
      "299"),
  MensBudgestStoreModel(
      "6",
      "https://m.media-amazon.com/images/I/71UaMLuWKaL._AC_UY1100_.jpg",
      "Bags",
      "299"),
];

// This data show Mens & Womens or other
// Product with Budget
List<TrendingStoreModel> trendingStore = [
  TrendingStoreModel(
      "1",
      "https://media.post.rvohealth.io/wp-content/uploads/2021/02/smiling_woman_wearing_eyewear_on_blue_wall_732x549-thumbnail-732x549.jpg",
      "Premium Sunglasses"),
  TrendingStoreModel(
      "2",
      "https://www.jiomart.com/images/product/original/rvbvzxi9m3/d-shoes-men-s-stylish-trendy-mesh-lace-ups-converse-style-sneakers-white-product-images-rvbvzxi9m3-0-202303260354.jpg?im=Resize=(500,630)",
      "Stylish Shoes for Men"),
  TrendingStoreModel(
      "3",
      "https://m.media-amazon.com/images/I/61j2F7sfSbL._AC_UF1000,1000_QL80_.jpg",
      "Beautiful Home Decor"),
  TrendingStoreModel(
      "4",
      "https://images.meesho.com/images/products/242438178/snwt7_512.webp",
      "Cotton Tops"),
];

// This data show elctornics data on dashboard
List<ElectronicStoreModel> electronicStore = [
  ElectronicStoreModel(
      "1",
      "https://m.media-amazon.com/images/I/61bPtcBD5AL._AC_UF1000,1000_QL80_.jpg",
      "Smart Watches",
      "300"),
  ElectronicStoreModel(
      "2",
      "https://i.guim.co.uk/img/media/d104826796b7bd5152f320b727deb5d20a69f188/469_374_5563_3338/master/5563.jpg?width=1200&height=1200&quality=85&auto=format&fit=crop&s=444f5abe152939d1e224f6d50d979ac8",
      "Windows Laptop",
      "300"),
  ElectronicStoreModel(
      "3",
      "https://imgeng.jagran.com/images/2023/aug/Best%20LG%20TV%20In%20India%2050%20Inch%20Smart%20TV%20Vs%2055%20Inch%20TV%20Vs%2065%20Inch%20LED%20TV1692627101684.jpg",
      "LED TV",
      "300"),
  ElectronicStoreModel(
      "4",
      "https://fs.npstatic.com/userfiles/7715851/image/Best_Smartphones_Under_400_2022_10-w810h462.jpg",
      "Smart Phones",
      "300"),
];

// This data show other electronics product view

List<OtherAccessoriesModel> otherAccessories = [
  OtherAccessoriesModel("1", "Mobile Covers",
      "https://5.imimg.com/data5/SELLER/Default/2023/1/TO/NL/SO/34019207/whatsapp-image-2023-01-31-at-12-43-18-pm-1-.jpeg"),
  OtherAccessoriesModel("2", "Earphones",
      "https://img.beatxp.com/prod/product/304/Untitled-1%20copy.webp"),
  OtherAccessoriesModel("3", "Mobile chargers",
      "https://www.ubuy.co.in/productimg/?image=aHR0cHM6Ly9pbWFnZXMtY2RuLnVidXkuY28uaW4vNjM0ZGYzZWJiNThlYTY3MjMyMjJkYzY2LWFuZHJvaWQtY2hhcmdlci0yLXBhY2stMi0xYS1kdWFsLXBvcnQuanBn.jpg"),
  OtherAccessoriesModel("4", "Smart Watches",
      "https://img.beatxp.com/prod/product/304/Untitled-1%20copy.webp"),
];

// This data show other categories view

List<ExploreMoreModel> exploreMore = [
  ExploreMoreModel('1', 'Machine',
      "https://www.lg.com/in/images/washing-machines/md07540887/gallery/FHM1408BDL-Washing-Machines-Right-View-MZ-04-v1.jpg"),
  ExploreMoreModel('2', 'Fridge',
      "https://m.media-amazon.com/images/I/71A+zv1sxhL._AC_UF1000,1000_QL80_.jpg"),
  ExploreMoreModel('3', 'Conditioners',
      "https://www.91-cdn.com/pricebaba-blogimages/wp-content/uploads/2018/01/air-conditioner-india-feature.jpg"),
  ExploreMoreModel('4', 'Fans',
      "https://www.orientelectric.com/images/gallery/New%20Breeze%20-%204%20Blades%20Ceiling%20Fan.png"),
  ExploreMoreModel('5', 'Lights',
      "https://prideelectronics.in/wp-content/uploads/2020/08/CATALOG-scaled.jpg"),
  ExploreMoreModel('6', 'Water Purifiers',
      "https://www.kent.co.in/images/water-purifiers/water-purifier.png"),
  ExploreMoreModel('7', 'Oven',
      "https://cdn.staticans.com/image/tr:e-sharpen-01,h-1500,w-1500,cm-pad_resize/data/philips/otg_28072021.jpg"),
  ExploreMoreModel('8', 'Mixer Grinders',
      "https://www.kent.co.in/images/kitchen-appliances/grinder-blender/mobile-banner-sharp-MG.png"),
  ExploreMoreModel('9', 'Irons',
      "https://cdn.thewirecutter.com/wp-content/media/2023/01/clothing-iron-2048px-3030.jpg?auto=webp&quality=75&crop=1.91:1&width=1200"),
];

// This data show Shop brand images

List<ShopBrandsModel> showBrandData = [
  ShopBrandsModel(
    "1",
    "https://logos-world.net/wp-content/uploads/2020/08/Dell-Emblem.jpg",
  ),
  ShopBrandsModel(
    "2",
    "https://upload.wikimedia.org/wikipedia/commons/thumb/0/03/Lenovo_Global_Corporate_Logo.png/2560px-Lenovo_Global_Corporate_Logo.png",
  ),
  ShopBrandsModel(
    "3",
    "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ad/HP_logo_2012.svg/2048px-HP_logo_2012.svg.png",
  ),
  ShopBrandsModel(
    "4",
    "https://gumlet.assettype.com/creativegaga%2F2022-08%2F909212b8-7a66-49e2-989c-13f7ff278453%2FASUS_New_Logo_News_jpg.webp?auto=format%2Ccompress&format=webp&w=400&dpr=2.6",
  ),
  ShopBrandsModel(
    "5",
    "https://static.vecteezy.com/system/resources/previews/019/136/299/original/acer-logo-acer-icon-free-free-vector.jpg",
  ),
  ShopBrandsModel(
    "6",
    "https://c4.wallpaperflare.com/wallpaper/263/51/808/apple-inc-minimalism-logo-simple-wallpaper-preview.jpg",
  ),
];

// This data show all Products for user

List<ProductsModel> ProductModelss = [
  ProductsModel(
      "1",
      "https://handcmediastorage.blob.core.windows.net/productimages/NY/NYDFF016-E12-177644-500px-650px.jpg",
      "Stylish Casual T-Shirt",
      "300",
      "250",
      "3"),
  ProductsModel(
      "1",
      "https://handcmediastorage.blob.core.windows.net/productimages/NY/NYDFF016-E12-177644-500px-650px.jpg",
      "Stylish Casual T-Shirt",
      "300",
      "250",
      "3"),
  ProductsModel(
      "1",
      "https://handcmediastorage.blob.core.windows.net/productimages/NY/NYDFF016-E12-177644-500px-650px.jpg",
      "Stylish Casual T-Shirt",
      "300",
      "250",
      "3"),
  ProductsModel(
      "1",
      "https://handcmediastorage.blob.core.windows.net/productimages/NY/NYDFF016-E12-177644-500px-650px.jpg",
      "Stylish Casual T-Shirt",
      "300",
      "250",
      "3"),
  ProductsModel(
      "1",
      "https://handcmediastorage.blob.core.windows.net/productimages/NY/NYDFF016-E12-177644-500px-650px.jpg",
      "Stylish Casual T-Shirt",
      "300",
      "250",
      "3"),
  ProductsModel(
      "1",
      "https://handcmediastorage.blob.core.windows.net/productimages/NY/NYDFF016-E12-177644-500px-650px.jpg",
      "Stylish Casual T-Shirt",
      "300",
      "250",
      "3"),
];
