import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/data/join_or_login.dart';
import 'package:flutter_login/helper/login_background.dart';
import 'package:flutter_login/screens/forget_pw.dart';
import 'package:provider/provider.dart';

class AuthPage extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size; //화면사이즈

    return Scaffold(
        body: Stack(
      //childen맨위코드가 화면 맨 아래위치
      alignment: Alignment.center,
      children: [
        CustomPaint(
          //새로 클래스만들어 구현해줘야함
          size: size,
          painter:
              LoginBackground(isJoin: Provider.of<JoinOrLogin>(context).isJoin),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            _logoImage,
            Stack(
              children: [
                _inputForm(size),
                _authButton(size),
              ],
            ),
            Container(
              height: size.height * 0.1,
            ),
            Consumer<JoinOrLogin>(
              builder: (context, value, child) => GestureDetector(
                  onTap: () {
                    value.toggle();
                  },
                  child: Text(
                    value.isJoin
                        ? "Already Have an Account? Sign in"
                        : "Dont Have an Account? Create One",
                    style: TextStyle(
                        color: value.isJoin ? Colors.red : Colors.blue),
                  )),
            ),
            Container(
              height: size.height * 0.05,
            ),
          ],
        )
      ],
    ));
  }

  void _register(BuildContext context) async {
    print("hi");
    //계정등록
    final UserCredential result = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: _emailController.text, password: _passwordController.text);
    final User user = result.user;

    if (user == null) {
      final snacBar = SnackBar(
        content: Text('Please try again later'),
      );
      Scaffold.of(context).showSnackBar(snacBar);
    }
  }

  void _login(BuildContext context) async {
    //계정생성
    final UserCredential result = await FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: _emailController.text, password: _passwordController.text);
    final User user = result.user;

    if (user == null) {
      final snacBar = SnackBar(
        content: Text('Please try again later'),
      );
      Scaffold.of(context).showSnackBar(snacBar);
    }
  }

  Widget get _logoImage => Expanded(
        // 매개변수가 없으면 get을 쓰고 ()이거 생략
        //column과 row 안에서 사용되는데 남는 공간을 다 차지함
        child: Padding(
          padding: const EdgeInsets.only(top: 40, left: 24, right: 24),
          child: FittedBox(
            //column으로 세로만 확장된거 전체적확장으로 바꿔줌
            fit: BoxFit.contain,
            child: CircleAvatar(
              backgroundImage:
                  NetworkImage("http://i3.wp.com/i.gifer.com/7pv.gif"),
            ),
          ),
        ),
      );
  Widget _authButton(Size size) {
    return Positioned(
      left: size.width * 0.15,
      right: size.width * 0.15,
      bottom: 0,
      child: SizedBox(
          height: 50,
          child: Consumer<JoinOrLogin>(
            builder: (context, value, child) => RaisedButton(
              child: Text(
                value.isJoin ? "Join" : "Login",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              color: value.isJoin ? Colors.red : Colors.blue,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  value.isJoin ? _register(context) : _login(context);
                }
              },
            ),
          )),
    );
  }

  Widget _inputForm(Size size) {
    return Padding(
      padding: EdgeInsets.all(size.width * 0.05),
      child: Card(
        //디자인 위젯
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 12,
        child: Padding(
          padding: const EdgeInsets.only(
              left: 12.0, right: 12.0, top: 12, bottom: 32),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    icon: Icon(Icons.account_circle),
                    labelText: "Email",
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Please input corrent Email.";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  obscureText: true,
                  controller: _passwordController,
                  decoration: InputDecoration(
                    icon: Icon(Icons.vpn_key),
                    labelText: "Password",
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Please input corrent Password.";
                    }
                    return null;
                  },
                ),
                Container(
                  height: 8,
                ),
                Consumer<JoinOrLogin>(
                  builder: (context, value, child) => Opacity(
                    //opacity는 투명함조절 0은 투명 1은 보이게
                    opacity: value.isJoin ? 0 : 1,
                    child: GestureDetector(
                        onTap: value.isJoin
                            ? null
                            : () {
                                goToForgetPw(context);
                              },
                        child: Text("Forgot PassWord")),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  goToForgetPw(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ForgetPw()));
  }
}
