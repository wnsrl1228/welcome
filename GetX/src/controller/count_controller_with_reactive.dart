import 'package:get/get.dart';

enum NUM { FIRST, SECOND }

class User {
  String name;
  int age;
  User({this.name, this.age});
}

class CountControllerWithReactive extends GetxController {
  RxInt count = 0.obs;
  RxDouble _double = 0.0.obs;
  RxString value = "".obs;
  Rx<NUM> nums = NUM.FIRST.obs;
  Rx<User> user = User(name: "개남", age: 25).obs;
  RxList<String> list = [""].obs;
  void increase() {
    count++;
    _double++;
    _double(123);
    nums(NUM.SECOND);
    user(User());
    user.update((_user) {
      _user.name = "개개개";
    });
    // list.addAll();
    // list.add();
    list.addIf(user.value.name == "김준기", "okay");
  }

  void putNumber(int value) {
    count(value);
  }

  @override
  void onInit() {
    ever(count, (_) => print("매번호출")); //값이 변경될때마다 호출 (리액트일때만 가능)
    super.onInit();
    once(count, (_) => print("한번만 호출")); //값변경시 한번만 호출
    debounce(count, (_) => print("마지막 변경에 한번만 호출"), time: Duration(seconds: 1));
    interval(count, (_) => print("변경되고 있는 동안 1초마다 호출"),
        time: Duration(seconds: 1));
  }
}
