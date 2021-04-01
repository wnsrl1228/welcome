import 'package:flutter/material.dart';
import 'package:flutter_getx_practice/src/controller/count_controller_with_getx.dart';
import 'package:get/get.dart';

class WithGetX extends StatelessWidget {
  Widget _bottom(String id) {
    return RaisedButton(
      child: Text("+", style: TextStyle(fontSize: 30)),
      onPressed: () {
        Get.find<CountControllerWithGetx>().increase();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "GetX",
            style: TextStyle(fontSize: 30),
          ),
          GetBuilder<CountControllerWithGetx>(
            id: "first",
            builder: (controller) {
              return Text(
                "${controller.count}",
                style: TextStyle(fontSize: 50),
              );
            },
          ),
          GetBuilder<CountControllerWithGetx>(
            id: "second",
            builder: (controller) {
              return Text(
                "${controller.count}",
                style: TextStyle(fontSize: 50),
              );
            },
          ),
          _bottom("first"),
          _bottom("second")
        ],
      ),
    );
  }
}
