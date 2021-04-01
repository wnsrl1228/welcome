import 'package:flutter/material.dart';
import 'package:flutter_getx_practice/src/binding/binding_page.dart';
import 'package:flutter_getx_practice/src/controller/count_controller_with_getx.dart';
import 'package:flutter_getx_practice/src/home.dart';
import 'package:flutter_getx_practice/src/pages/binding.dart';
import 'package:flutter_getx_practice/src/pages/named/first.dart';
import 'package:flutter_getx_practice/src/pages/named/second.dart';
import 'package:flutter_getx_practice/src/pages/next.dart';
import 'package:flutter_getx_practice/src/pages/user.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

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
      // routes: {
      //   "/": (context) => Home(),
      //   "first": (context) => FirstNamedPage(),
      //   "second": (context) => SecondNamedPage(),
      // },
      getPages: [
        GetPage(name: "/", page: () => Home(), transition: Transition.zoom),
        GetPage(
            name: "/first",
            page: () => FirstNamedPage(),
            transition: Transition.zoom),
        GetPage(
            name: "/second",
            page: () => SecondNamedPage(),
            transition: Transition.zoom),
        GetPage(
            name: "/next", page: () => NextPage(), transition: Transition.zoom),
        GetPage(
            name: "/user", page: () => UserPage(), transition: Transition.zoom),
        GetPage(
            name: "/binding",
            page: () => BindingPage(),
            binding: BindingPageBinding())
      ],
    );
  }
}
