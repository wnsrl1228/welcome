import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home.dart';

class NextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NextPage"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                "${(Get.arguments as User).name} : ${(Get.arguments as User).age}"),
            RaisedButton(
              child: Text("뒤로이동"),
              onPressed: () {
                Get.back();
              },
            ),
          ],
        ),
      ),
    );
  }
}
