import 'package:flutter/material.dart';
import 'package:flutter_getx_practice/src/pages/dependencys/dependency_manage_page.dart';
import 'package:flutter_getx_practice/src/pages/reactive_state_manage_page.dart';
import 'package:flutter_getx_practice/src/pages/simple_state_manage_page%20copy.dart';
import 'package:get/get.dart';

import 'pages/named/first.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("라우트 관리 홈"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              child: Text("일반적인 라우트"),
              onPressed: () {
                Get.to(FirstNamedPage());
              },
            ),
            RaisedButton(
              child: Text("Named 라우트"),
              onPressed: () {
                Get.toNamed("/first");
              },
            ),
            RaisedButton(
              child: Text("Argument 전달 "),
              onPressed: () {
                Get.toNamed("/next", arguments: User(name: "준기", age: 21));
                // Get.to("/first", arguments: "개남");
              },
            ),
            RaisedButton(
              child: Text("동적 url "),
              onPressed: () {
                Get.toNamed("/user?uid=28392&name=개남&age=22");
                // Get.to("/first", arguments: "개남");
              },
            ),
            RaisedButton(
              child: Text("단순 상태관리 "),
              onPressed: () {
                Get.to(SimpleStateManagePage());
              },
            ),
            RaisedButton(
              child: Text("반응형상태관리 "),
              onPressed: () {
                Get.to(ReactiveStateManagePage());
              },
            ),
            RaisedButton(
              child: Text("의존성 관리 "),
              onPressed: () {
                Get.to(DependencyManagePage());
              },
            ),
            RaisedButton(
              child: Text("바인딩 "),
              onPressed: () {
                Get.toNamed("/binding");
              },
            ),
          ],
        ),
      ),
    );
  }
}

class User {
  String name;
  int age;
  User({this.name, this.age});
}
