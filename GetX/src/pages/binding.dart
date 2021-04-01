import 'package:flutter/material.dart';
import 'package:flutter_getx_practice/src/controller/count_controller_with_getx.dart';
import 'package:get/get.dart';

class BindingPage extends GetView<CountControllerWithGetx> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Obx(
            () => Text(
              controller.count.toString(),
              style: TextStyle(fontSize: 40),
            ),
          ),
          RaisedButton(
            onPressed: () {
              controller.increase();
              // CountControllerWithGetx.to.increase();
              // Get.find<CountControllerWithGetx>().increase();
            },
          )
        ],
      ),
    );
  }
}
