import 'package:flutter/material.dart';
import 'package:flutter_getx_practice/src/controller/dependency_controller.dart';
import 'package:get/get.dart';

class GetLazyPut extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: RaisedButton(
        onPressed: () {
          Get.find<DependencyController>().increase();
        },
      ),
    );
  }
}
