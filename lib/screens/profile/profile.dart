import 'package:flutter/material.dart';
import 'package:guzel_ama_ingilicce/screens/authenticate/register.dart';
import 'package:guzel_ama_ingilicce/services/auth.dart';
import 'package:guzel_ama_ingilicce/shared/constants.dart';
import 'package:toast/toast.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:guzel_ama_ingilicce/shared/loading.dart';


class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  User inputData() {
    User currentUser = auth.currentUser;
    final uid = currentUser.uid;
    return currentUser;
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          child: Text('Profile'+inputData().toString()),
        ),
         RaisedButton(
            child: Text('Open route'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SecondRoute()),
              );
            },
        ),


          ],
    );
  }
}

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Profile"),
        backgroundColor: Colors.blue[300],
        elevation: 0.0,
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}