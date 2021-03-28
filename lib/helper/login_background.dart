import 'package:flutter/material.dart';

class LoginBackground extends CustomPainter {
  LoginBackground({@required this.isJoin});
  final bool isJoin;
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = isJoin ? Colors.red : Colors.blue;
    canvas.drawCircle(Offset(size.width * 0.5, size.height * 0.2),
        size.height * 0.5, paint); //위치,높이,색
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false; //프레임당 화면 변환을 해주냐? 안해준다
  }
}
