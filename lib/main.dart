import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'src/app.dart';
import 'src/pages/home.dart';
import 'src/pages/make_notice_board.dart';
import 'src/pages/notice_board.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: "/",
      getPages: [
        GetPage(name: "/", page: () => App()),
        GetPage(name: "/noticeBoard", page: () => NoticeBoard()),
        GetPage(name: "/makeboard", page: () => MakeNoticeBoard()),
      ],
    );
  }
}
