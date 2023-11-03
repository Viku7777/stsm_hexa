import 'package:get/get.dart';

class LoadingController extends GetxController {
  bool isLoading = false;
  updateLoadingState() {
    isLoading = !isLoading;
    update();
  }
}
