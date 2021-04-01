import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home.dart';

class UserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("UserPage"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("${Get.parameters['uid']}"),
            Text("${Get.parameters['name']}님 안녕"),
            Text("${Get.parameters['age']}"),
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
