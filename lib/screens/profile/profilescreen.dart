import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'dart:math';


class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _currentPointForUser2;
  User _asd = FirebaseAuth.instance.currentUser;
  String currentPointForUser;
  dynamic level = "hesaplanıyor...";
  void initState(){
    super.initState();
    getUserPoint();
    
  }
  

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue[50],
      child: Column(

        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 4,
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 3,
                    child: Image(
                      image: AssetImage("assets/mario.png"),
                      height: 90.0,
                      width: 90.0,
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: Column(

                      children: <Widget>[
                        Expanded(
                          flex: 3,
                          child: Row(

                            children: <Widget>[
                              Expanded(
                              flex: 4,
                                  child: Text(
                                    "Kullanıcı Adı:      ",
                                    style: GoogleFonts.mcLaren(),
                                  ),
                              ),
                              Expanded(
                                flex: 2,
                                  child: Text(
                                    "Level:  $level",style: GoogleFonts.mcLaren(),
                                  )
                              )
                          ]
                          ),
                        ),
                        Expanded(
                          flex: 2,
                            child: Text("$level . level için ")),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: new Text(
                "The Flash",
                style: GoogleFonts.mcLaren(),
              ),
            ),
            Expanded(
              flex: 10,
              child: Row(
                children: <Widget>[

                  Expanded(
                    flex: 3,
                    child: Image(
                      image: AssetImage("assets/mario.png"),
                      height: 60.0,
                      width: 60.0,
                    ),
                  ),
                  Expanded(
                    flex: 7,
                      child: Text("50 kelimeye ulaştın.\nÇoğu kişi günde 50 kelimeden fazlasını kullanmaz.")),
                ],
              ),
            ),

          ],
        ),
    );
  
  
  
  }
  void getUserPoint() async{
      
      await FirebaseFirestore.instance.collection("users").doc(_asd.uid.toString()).get().then((value){
        currentPointForUser = value.get("userPoint").toString();
      });
      _currentPointForUser2 = int.parse(currentPointForUser);
      
      setState(() {
        level = _currentPointForUser2 ~/ 100;
        level = level.toString();
      });
      
      
  }
}