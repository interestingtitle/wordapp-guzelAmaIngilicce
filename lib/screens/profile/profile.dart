import 'package:flutter/material.dart';
import 'package:guzel_ama_ingilicce/models/user.dart';
import 'package:guzel_ama_ingilicce/screens/authenticate/register.dart';
import 'package:guzel_ama_ingilicce/screens/profile/profilesettings.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:guzel_ama_ingilicce/services/database.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:guzel_ama_ingilicce/services/auth.dart';
class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  final AuthService _auth = AuthService();

  String a = "ahmet";
  int b = 15;

//  User inputData() {
//    User currentUser = auth.currentUser;
//    final uid = currentUser.uid;
//    return currentUser;
//  }
    @override
    Widget build(BuildContext context) {
      final user = Provider.of<CUser>(context);
      return Container(

        child:ListView(

        children: <Widget>[
          //SizedBox(height: 20.0,),
          SizedBox(
            height: 50.0,
            child: RaisedButton(
              color: Colors.grey[100],
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text('Profile Settings            '
                    '                  '
                    '                  '
                    '           >'),
              ),
              onPressed: () async{

              },
            ),
          ),
          SizedBox(
            height: 50.0,
            child: RaisedButton(
              color: Colors.grey[100],
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text('b Settings            '
                    '                  '
                    '                  '
                    '                    >'),
              ),
              onPressed: () async{
                await DatabaseService(uid: user.uid).updateUserData("ahmet",15);

              },
            ),
          ),
          SizedBox(
            height: 50.0,
            child: RaisedButton(
              color: Colors.grey[100],
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text('A Settings            '
                    '                  '
                    '                  '
                    '                   >'),
              ),
              onPressed: () {

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileSettings()),
                );
              },
            ),
          ),
        ],
      ),
      );

    }
  }

