import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("메인 페이지"),
        ),
        body: Center(
          child: Text("안녕"),
        ));
  }
}
