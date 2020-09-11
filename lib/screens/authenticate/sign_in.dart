import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        backgroundColor: Colors.blue[400],
        elevation: 0.0,
        title: Text("Güzel Ama İngilicce"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: RaisedButton(
          child: Text("Anonim Giriş Yap"),
          onPressed: () async{
            Toast.show(
                "Welcome: ", context, duration: Toast.LENGTH_SHORT,
                gravity: Toast.BOTTOM);
            print("nvm");
          },
        ),
      ),
    );
  }
}