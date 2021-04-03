import 'package:flutter/material.dart';
import 'package:flutter_youtude_clone/src/info/userinfo.dart';
import 'package:get/get.dart';

import 'notice_board.dart';

class MakeNoticeBoard extends StatefulWidget {
  @override
  _MakeNoticeBoardState createState() => _MakeNoticeBoardState();
}

class _MakeNoticeBoardState extends State<MakeNoticeBoard> {
  final TextEditingController titleName = TextEditingController();
  final TextEditingController description = TextEditingController();

  @override
  void dispose() {
    titleName.dispose();
    description.dispose();
    super.dispose();
  }

  Widget _body() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(30),
            child: Center(
                child: Column(
              children: [
                TextField(
                  controller: titleName,
                ),
                TextField(
                  controller: description,
                ),
                SizedBox(
                  height: 30,
                ),
                FloatingActionButton(
                  child: Text("제출"),
                  onPressed: () {
                    Get.offAllNamed("/",
                        arguments: UserInfo(
                            title: titleName.text,
                            description: description.text));
                  },
                )
              ],
            )),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _body());
  }
}
