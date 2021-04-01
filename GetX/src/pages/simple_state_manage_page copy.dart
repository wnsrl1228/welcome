import 'package:flutter/material.dart';
import 'package:flutter_getx_practice/src/controller/count_controller_with_getx.dart';
import 'package:flutter_getx_practice/src/controller/count_controller_with_provider%20copy.dart';
import 'package:flutter_getx_practice/src/pages/state/with_getx.dart';
import 'package:flutter_getx_practice/src/pages/state/with_provider.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class SimpleStateManagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(CountControllerWithGetx());
    return Scaffold(
      appBar: AppBar(
        title: Text("단순상태관리"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: WithGetX(),
            ),
            Expanded(
              child: ChangeNotifierProvider<CountControllerWithProvider>(
                create: (_) => CountControllerWithProvider(),
                child: WithProvider(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
