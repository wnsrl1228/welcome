import 'package:flutter/material.dart';
import 'package:flutter_getx_practice/src/controller/dependency_controller.dart';
import 'package:get/get.dart';

import 'get_lazyput.dart';
import 'get_put.dart';

class DependencyManagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("의존성주입"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              child: Text("GetPut"),
              onPressed: () {
                Get.to(GetPut(), binding: BindingsBuilder(() {
                  Get.put(DependencyController());
                }));
              },
            ),
            RaisedButton(
              child: Text("Get.lazyPut"),
              onPressed: () {
                Get.to(GetLazyPut(), binding: BindingsBuilder(() {
                  Get.lazyPut<DependencyController>(
                      () => DependencyController());
                }));
              },
            ),
            RaisedButton(
              child: Text("Get.putAsync"),
              onPressed: () {
                Get.to(
                  GetPut(),
                  binding: BindingsBuilder(() {
                    Get.putAsync<DependencyController>(() async {
                      await Future.delayed(Duration(seconds: 5));
                      return DependencyController();
                    });
                  }),
                );
              },
            ),
            RaisedButton(
              child: Text("Get.create"),
              onPressed: () {
                Get.to(GetPut(), binding: BindingsBuilder(() {
                  Get.create<DependencyController>(
                      () => DependencyController());
                }));
              },
            ),
          ],
        ),
      ),
    );
  }
}
