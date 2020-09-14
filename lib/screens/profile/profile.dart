import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:guzel_ama_ingilicce/models/user.dart';
import 'package:guzel_ama_ingilicce/screens/profile/profilesettings.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:guzel_ama_ingilicce/services/auth.dart';
import 'package:provider/provider.dart';


class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  final FirebaseAuth auth = FirebaseAuth.instance;
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
      final fruits = Provider.of<QuerySnapshot>(context);
      return Container(

        child:ListView(
          padding: new EdgeInsets.all(1.0),
          children: <Widget>[
          SizedBox(
              height: 200.0,
              child:RaisedButton(
                color:Colors.white,
                onPressed: (){},
              ),

          ),
          SizedBox(
            height: 60,
            child:RaisedButton(

              color: Colors.grey[100],
              child: Align(

                alignment: Alignment.centerLeft,
                child: Text('Profile Settings            '
                    '                  '
                    '                  '
                    '            >'),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileSettings()),
                );
              },
            ),
          ),
          SizedBox(
            height: 60,
            child:RaisedButton(

              color: Colors.grey[100],
              child: Align(

                alignment: Alignment.centerLeft,
                child: Text('Profile Settings            '
                    '                  '
                    '                  '
                    '           >'),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileSettings()),
                );
              },
            ),
          ),
          SizedBox(
            height: 60,
            child:RaisedButton(

              color: Colors.grey[100],
              child: Align(

                alignment: Alignment.centerLeft,
                child: Text('Profile Settings            '
                    '                  '
                    '                  '
                    '           >'),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileSettings()),
                );
              },
            ),
          ),
          SizedBox(
            height: 60,
            child:RaisedButton(

              color: Colors.grey[100],
              child: Align(

                alignment: Alignment.centerLeft,
                child: Text('Profile Settings            '
                    '                  '
                    '                  '
                    '           >'),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileSettings()),
                );
              },
            ),
          ),
          SizedBox(
            height: 60,
            child:RaisedButton(

              color: Colors.grey[100],
              child: Align(

                alignment: Alignment.centerLeft,
                child: Text('Profile Settings            '
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

