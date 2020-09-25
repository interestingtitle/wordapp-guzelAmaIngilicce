import 'package:flutter/material.dart';
import 'package:guzelamaingilizce/services/auth.dart';
import 'package:guzelamaingilizce/shared/constants.dart';
import 'package:guzelamaingilizce/shared/loading.dart';
import 'package:flutter/cupertino.dart';
//import 'package:toast/toast.dart';
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
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0.0,
        title: Text("Güzel Ama İngilicce", style: TextStyle(fontSize: 18.0),),
        actions: <Widget>[
          FlatButton.icon(
              icon: Icon(Icons.person, color: Colors.white,),
              label: Text("Giriş Yap",style: TextStyle(color: Colors.white),),
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
                  SizedBox(height: 70.0,),
                  TextFormField(
                    textAlign: TextAlign.center,
                    decoration: textInputDecoration.copyWith(hintText: "E-mail"),
                    validator: (val){
                      if(val.isEmpty)
                        return "Lütfen geçerli bir email adresi giriniz";
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
                    textAlign: TextAlign.center,
                    decoration: textInputDecoration.copyWith(hintText: "Şifre"),
                    obscureText: true,
                    validator: (val){
                      if(val.length<6)
                        return "Şifre 6 karakterden az olamaz";
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
                    color: Colors.blue,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
                    child: Text(
                      "E-mail İle Kayıt Ol",
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
