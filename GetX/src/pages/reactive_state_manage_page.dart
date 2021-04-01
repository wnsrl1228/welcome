import 'package:flutter/material.dart';
import 'package:flutter_getx_practice/src/controller/count_controller_with_getx.dart';
import 'package:flutter_getx_practice/src/controller/count_controller_with_provider%20copy.dart';
import 'package:flutter_getx_practice/src/controller/count_controller_with_reactive.dart';
import 'package:flutter_getx_practice/src/pages/state/with_getx.dart';
import 'package:flutter_getx_practice/src/pages/state/with_provider.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class ReactiveStateManagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(CountControllerWithReactive());
    Get.put(CountControllerWithGetx());
    return Scaffold(
      appBar: AppBar(
        title: Text("반응형상태관리"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "GetX",
              style: TextStyle(fontSize: 30),
            ),
            Obx(
              () => Text(
                "${Get.find<CountControllerWithReactive>().count.value}",
                style: TextStyle(fontSize: 50),
              ),
            ),
            RaisedButton(
              child: Text("+", style: TextStyle(fontSize: 30)),
              onPressed: () {
                return Get.find<CountControllerWithReactive>().increase();
              },
            ),
            RaisedButton(
              child: Text("5로번경", style: TextStyle(fontSize: 30)),
              onPressed: () {
                return Get.find<CountControllerWithReactive>().putNumber(5);
              },
            ),
          ],
        ),
      ),
    );
  }
}
