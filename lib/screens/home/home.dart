import 'package:flutter/material.dart';
import 'package:guzel_ama_ingilicce/services/auth.dart';
class Home extends StatelessWidget {

  AuthService _firebaseAuth = AuthService();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Signed In"),
        backgroundColor: Colors.lightBlueAccent,
        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text("logout"),
            onPressed: () async{
              await _firebaseAuth.signOut();

            },
          ),
        ],
      ),
      body: Container(

      ),
    );
  }
}