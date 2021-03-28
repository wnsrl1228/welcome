import 'package:flutter/cupertino.dart';

class JoinOrLogin extends ChangeNotifier {
  bool _isJoin = false;

  bool get isJoin => _isJoin;

  void toggle() {
    _isJoin = !_isJoin;
    notifyListeners(); //변하게 알림 //해당클래스쓰는 provider애들 값 다 바꿔줌
  }
}
