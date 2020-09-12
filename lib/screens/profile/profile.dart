import 'package:flutter/material.dart';
import 'package:guzel_ama_ingilicce/screens/authenticate/register.dart';
import 'package:guzel_ama_ingilicce/screens/profile/profilesettings.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
      return Container(
        child:ListView(
        children: <Widget>[
          Text("Test1"),
          Text("Test2"),
          Text("Test3"),
        ],
      ),
      );
      return Row(

        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: <Widget>[

          Expanded(
            child: Text('Profile' + inputData().toString()),
          ),
          RaisedButton(
            child: Text('Open route'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileSettings()),
              );
            },
          ),


        ],
      );
    }
  }

