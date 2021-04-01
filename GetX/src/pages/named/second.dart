import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../home.dart';

class SecondNamedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("second Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              child: Text("일반적인 라우트"),
              onPressed: () {
                Get.back();
              },
            ),
            RaisedButton(
              child: Text("Named 라우트"),
              onPressed: () {
                Get.offAllNamed("/");
              },
            )
          ],
        ),
      ),
    );
  }
}
