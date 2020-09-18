import 'package:flutter/material.dart';
import 'package:guzel_ama_ingilicce/services/auth.dart';
import 'package:guzel_ama_ingilicce/shared/constants.dart';
import 'package:guzel_ama_ingilicce/shared/loading.dart';
import 'package:flutter/cupertino.dart';

class SignIn extends StatefulWidget {

  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

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
        title: Text("Güzel Ama İngiliççe"),
        actions: <Widget>[
          FlatButton.icon(

            icon: Icon(Icons.person, color: Colors.white,),
            label: Text("Kayıt Ol",style: TextStyle(color: Colors.white),),
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
                  decoration: textInputDecoration.copyWith(hintText: "Email"),
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
                  validator: (val){
                    if(val.length<6)
                      return "Şifre 6 karakterden az olamaz";
                    else
                      return null;
                  },
                  obscureText: true,
                  onChanged: (val){
                    setState(() {
                      password = val;
                    });
                  },

                ),
                SizedBox(height: 20.0,),
                RaisedButton(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
                  color: CupertinoColors.systemBlue,
                  child: Text(
                    " Giriş Yap",
                    style: TextStyle(
                      color: Colors.white
                    ),
                  ),
                  onPressed: () async{
                    if(_formKey.currentState.validate()) {
                      setState(() {
                        loading = true;
                      });
                      dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                      if(result == null){
                        setState(() {
                          loading = false;
                          error = "Lütfen geçerli bir email giriniz";
                        });
                      }
                    }

                  },
                ),
                SizedBox(height: 20.0,),
                OutlineButton(
                  splashColor: Colors.grey,
                  onPressed: () async{
                    {
                      setState(() {
                        loading = true;
                      });
                      dynamic result = await _auth.googleSignIn();
                      if(result == null){
                        setState(() {
                          loading = false;

                        });
                      }
                    }

                  },
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                  highlightElevation: 0,
                  borderSide: BorderSide(color: Colors.grey),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image(image: AssetImage("assets/google_logo.png"), height: 35.0),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            'Google Hesabıyla Giriş Yap',
                            style: TextStyle(
                              fontSize: 13,
                              color: CupertinoColors.systemBlue,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
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