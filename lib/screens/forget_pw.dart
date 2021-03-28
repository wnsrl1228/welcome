import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgetPw extends StatefulWidget {
  @override
  _ForgetPWState createState() => _ForgetPWState();
}

class _ForgetPWState extends State<ForgetPw> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forget Password"),
      ),
      body: Form(
        key: _formKey,
        child: Column(
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
            FlatButton(
              onPressed: () async {
                await FirebaseAuth.instance
                    .sendPasswordResetEmail(email: _emailController.text);
                SnackBar snacBar = SnackBar(
                  content: Text("Check your email for pw reset"),
                );
                Scaffold.of(_formKey.currentContext).showSnackBar(snacBar);
              },
              child: Text("Reset Password"),
            )
          ],
        ),
      ),
    );
  }
}
