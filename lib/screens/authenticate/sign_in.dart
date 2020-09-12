import 'package:flutter/material.dart';
import 'package:guzel_ama_ingilicce/screens/authenticate/register.dart';
import 'package:guzel_ama_ingilicce/services/auth.dart';
import 'package:toast/toast.dart';
class SignIn extends StatefulWidget {

  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        backgroundColor: Colors.blue[400],
        elevation: 0.0,
        title: Text("Güzel Ama İngilicce"),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text("Sign Up"),
            onPressed: (){
              widget.toggleView();
            },
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0,),
              TextFormField(
                onChanged: (val){
                  setState(() {
                    email = val;
                  });
                },
              ),
              SizedBox(height: 20.0,),
              TextFormField(
                obscureText: true,
                onChanged: (val){
                  setState(() {
                    password = val;
                  });
                },
              ),
              SizedBox(height: 20.0,),
              RaisedButton(
                color: Colors.blue[800],
                child: Text(
                  "Sign In",
                  style: TextStyle(
                    color: Colors.white
                  ),
                ),
                onPressed: () async{
                  await _auth.signInWithEmailAndPassword(email, password);
                },
              )
            ],
          ),
        )
      ),
    );
  }
}