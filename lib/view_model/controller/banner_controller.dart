import 'package:cattel_feed/model/banner_model/banner_model.dart';
import 'package:velocity_x/velocity_x.dart';

class BannerController {
  List<BannerModel> allBanners = [];
  updateBannerList(List<BannerModel> banners) {
    allBanners = banners;
    largeBanner.clear();
    smallPattBanner.clear();
    animalSupliments.clear();
    salesOffers.clear();
    categoiresBanner.clear();
    if (allBanners.isNotEmpty) {
      for (var element in allBanners) {
        if (element.title.isNotEmptyAndNotNull) {
          if (element.title!.toLowerCase().contains("salesoffers")) {
            for (var e in element.data!.first.imagelinks!) {
              salesOffers.add(e.imgUrl.toString());
            }
          } else if (element.title!
              .toLowerCase()
              .contains("animalsupliments")) {
            for (var e in element.data!.first.imagelinks!) {
              animalSupliments.add(e.imgUrl.toString());
            }
          } else if (element.title!.toLowerCase().contains("smallpattbanner")) {
            for (var e in element.data!.first.imagelinks!) {
              smallPattBanner.add(e.imgUrl.toString());
            }
          } else if (element.title!.toLowerCase().contains("largebanner")) {
            for (var e in element.data!.first.imagelinks!) {
              largeBanner.add(e.imgUrl.toString());
            }
            print("large length is ${largeBanner.length}");
          } else {
            for (var e in element.data!.first.imagelinks!) {
              categoiresBanner.add(e);
            }
          }
        }
      }
    }
  }

  static List<String> largeBanner = [];
  static List<String> smallPattBanner = [];
  static List<String> animalSupliments = [];
  static List<String> salesOffers = [];
  static List<Imagelinks> categoiresBanner = [];
}
