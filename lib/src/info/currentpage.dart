import 'package:get/get.dart';

class CurrentPage {
  RxInt currentPage = 0.obs;
  void updateCurrentPage(int page) {
    currentPage(page);
  }
}
