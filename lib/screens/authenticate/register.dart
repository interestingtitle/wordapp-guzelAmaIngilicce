import 'package:flutter/material.dart';
import 'package:guzel_ama_ingilicce/services/auth.dart';
import 'package:guzel_ama_ingilicce/shared/constants.dart';
import 'package:guzel_ama_ingilicce/shared/loading.dart';
import 'package:toast/toast.dart';
class Register extends StatefulWidget {

  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  String error = "";
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
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
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 20.0,),
                  TextFormField(
                    decoration: textInputDecoration.copyWith(hintText: "Email"),
                    validator: (val){
                      if(val.isEmpty)
                        return "Enter an email";
                      else
                        return null;
                    },
                    onChanged: (val){
                      setState(() {
                        email = val;
                      });
                    },
                  ),
                  SizedBox(height: 20.0,),
                  TextFormField(

                    decoration: textInputDecoration.copyWith(hintText: "Password"),
                    obscureText: true,
                    validator: (val){
                      if(val.length<6)
                        return "Password cannot be less than 6 character";
                      else
                        return null;
                    },
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
                      if(_formKey.currentState.validate()) {
                        setState(() {
                          loading = true;
                        });
                        dynamic result = await _auth.createUserWithEmailAndPassword(email, password);
                        if(result == null){
                          setState(() {
                            loading = false;
                            error = "Please write a valid email!";
                          });
                        }
                      }

                    },
                  ),
                  SizedBox(height: 20.0,),
                  Text(
                    error,
                    style: TextStyle(color: Colors.black, fontSize: 14.0),
                  )
                ],
              ),
            ),
          )
      ),
    );
  }
}
