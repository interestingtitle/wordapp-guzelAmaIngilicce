import 'package:flutter/material.dart';
import 'package:guzel_ama_ingilicce/services/auth.dart';

class Register extends StatefulWidget {

  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

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
              label: Text("Sign In"),
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
                    "Sign Up",
                    style: TextStyle(
                        color: Colors.white
                    ),
                  ),
                  onPressed: () async{
                    await _auth.createUserWithEmailAndPassword(email, password);


                  },
                )
              ],
            ),
          )
      ),
    );
  }
}
