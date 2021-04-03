import 'package:flutter/material.dart';
import 'package:flutter_youtude_clone/src/pages/home.dart';
import 'package:flutter_youtude_clone/src/pages/notice_board.dart';
import 'package:get/get.dart';

import 'info/currentpage.dart';

class App extends StatelessWidget {
  Widget _bodyWidget() {
    switch (Get.find<CurrentPage>().currentPage.value) {
      case 0:
        return Home();
        break;

      case 1:
        return NoticeBoard();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    Get.put(CurrentPage());

    return Obx(() {
      return Scaffold(
        body: _bodyWidget(),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            Get.find<CurrentPage>().updateCurrentPage(index);
          },
          currentIndex: Get.find<CurrentPage>().currentPage.value,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.ac_unit), label: "홈"),
            BottomNavigationBarItem(icon: Icon(Icons.ac_unit), label: "게시판")
          ],
        ),
      );
    });
  }
}
