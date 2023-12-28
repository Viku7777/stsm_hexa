import 'package:cattel_feed/model/banner_model/banner_model.dart';

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
        String title = element.title.toLowerCase();
        switch (title) {
          case "salesoffers":
            for (var e in element.data) {
              salesOffers.add(e.imgUrl.toString());
            }
            break;
          case "animalsupliments":
            for (var e in element.data) {
              animalSupliments.add(e.imgUrl.toString());
            }
          case "smallpattbanner":
            for (var e in element.data) {
              smallPattBanner.add(e.imgUrl.toString());
            }
            break;
          case "largebanner":
            for (var e in element.data) {
              largeBanner.add(e.imgUrl.toString());
            }
            break;

          default:
            for (var e in element.data) {
              categoiresBanner.add(e);
            }
        }
      }
    }
  }

  static List<String> largeBanner = [];
  static List<String> smallPattBanner = [];
  static List<String> animalSupliments = [];
  static List<String> salesOffers = [];
  static List<BannerDataModel> categoiresBanner = [];
}
