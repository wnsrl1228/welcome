import 'package:flutter/material.dart';
import 'package:flutter_youtude_clone/src/info/userinfo.dart';
import 'package:get/get.dart';

import 'make_notice_board.dart';

class NoticeBoard extends StatelessWidget {
  UserInfo userInfo;

  Future<UserInfo> info() async {
    return userInfo = await Get.arguments as UserInfo;
  }

  Widget _body() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FutureBuilder(
            future: info(),
            builder: (context, snapshot) {
              if (snapshot.connectionState != ConnectionState.done) {
                return CircularProgressIndicator();
              }
              if (snapshot.hasData) {
                return Column(
                  children: [
                    Text(snapshot.data.title),
                    Text(snapshot.data.description),
                  ],
                );
              }
              return CircularProgressIndicator();
            },
          ),
          SizedBox(
            height: 100,
          ),
          FloatingActionButton(
            onPressed: () {
              Get.toNamed("/makeboard");
            },
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    print(Get.arguments);
    return Scaffold(
        appBar: AppBar(
          title: Text("게시판입니다."),
        ),
        body: _body());
  }
}
