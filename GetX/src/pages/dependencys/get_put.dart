import 'package:flutter/material.dart';
import 'package:flutter_getx_practice/src/controller/dependency_controller.dart';
import 'package:get/get.dart';

class GetPut extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: RaisedButton(
        onPressed: () {
          print(Get.find<DependencyController>().hashCode);
          Get.find<DependencyController>().increase();
        },
      ),
    );
  }
}
