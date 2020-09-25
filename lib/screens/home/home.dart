import 'package:flutter/material.dart';
import 'package:guzelamaingilizce/screens/profile/profilescreen.dart';
import 'package:guzelamaingilizce/screens/words/wordsmain.dart';
import 'package:guzelamaingilizce/services/auth.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:guzelamaingilizce/screens/home/settings.dart';
import 'package:guzelamaingilizce/services/database.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  AuthService _firebaseAuth = AuthService();
  int _pageIndex = 1;
  //GlobalKey _bottomNavigationKey = GlobalKey();
  List <Widget> _widgets=<Widget>[
    ProfileScreen(),
    Words(),
    Profile(),
  ];
  void _onItemTap(int index)
  {
    setState(() {
      _pageIndex=index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot>.value(
      value: DatabaseService().fruits,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Hoşgeldiniz",style: TextStyle(fontSize: 16.0),),
          backgroundColor: Colors.blue,
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.person, color: Colors.white,),
              label: Text("Çıkış Yap",style: TextStyle(color: Colors.white),),
              onPressed: () async{
                await _firebaseAuth.signOut();

              },
            ),
          ],
        ),
        bottomNavigationBar: CurvedNavigationBar(
          index: 1,
          height: 50.0,
          items: <Widget>[
            Icon(Icons.perm_identity, size: 30),
            Icon(Icons.home, size: 30),
            //Icon(Icons.compare_arrows, size: 30),
            //Icon(Icons.call_split, size: 30),
            Icon(Icons.settings, size: 30),
          ],
          color: Colors.white,
          buttonBackgroundColor: Colors.white,
          backgroundColor: Colors.blue[50],
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 200),
          onTap: (index) {
            _onItemTap(index);
          },
        ),
        body: Container(
          color: Colors.lightBlue[200],
          child: _widgets.elementAt(_pageIndex),
        ),
              ),
    );



  }
}