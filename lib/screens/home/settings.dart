//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:guzelamaingilizce/screens/profile/profilesettings.dart';
import 'package:url_launcher/url_launcher.dart';

launchURL() async {
  const url = 'https://github.com/interestingtitle';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  final FirebaseAuth auth = FirebaseAuth.instance;
  //final AuthService _auth = AuthService();


//  User inputData() {
//    User currentUser = auth.currentUser;
//    final uid = currentUser.uid;
//    return currentUser;
//  }
    @override
    Widget build(BuildContext context) {
      //final user = Provider.of<CUser>(context);
      //final fruits = Provider.of<QuerySnapshot>(context);

      return Container(
        color: Colors.blue[50],
        child:ListView(
          padding: new EdgeInsets.all(1.0),
          children: <Widget>[
            SizedBox(
              height: 100,
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 30),
                  Text(
                    "Güzel Ama İngilizce",
                    style: Theme.of(context).textTheme.headline5,
                    textAlign: TextAlign.center,
                  ),
                  //if (icon != null)
                  // IconTheme(data: Theme.of(context).iconTheme, child: icon),
                  Text(
                    "v1.0.0",
                    style: Theme.of(context).textTheme.bodyText2,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 60.0,
              child:RaisedButton(
                color:Colors.blue[50],
                onPressed:(){
                  launchURL();
                },
                child: Text("2020 © InterestingTitle \ngithub.com/interestingtitle"),
              ),

            ),
         /* SizedBox(
              height: 150.0,
              child:RaisedButton(
                color:Colors.white,
                onPressed: (){},
                shape: CircleBorder(),
              ),

          ),*/


          SizedBox(
            height: 60,
            child:RaisedButton(

              color: Colors.grey[100],
              child: Align(

                alignment: Alignment.centerLeft,
                child: Text('Profil Ayarları            '
                    '                  '
                    '                  '
                    '           '
                    '              >'),
              ),
              onPressed: () {
                /*Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileSettings()),
                );*/
              },
            ),
          ),
          SizedBox(
            height: 60,
            child:RaisedButton(

              color: Colors.grey[100],
              child: Align(

                alignment: Alignment.centerLeft,
                child: Text('Oyun Ayarları            '
                    '                  '
                    '                  '
                    '             '
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
                child: Text('Gizlilik               '
                    '                  '
                    '                  '
                    '                     '
                    '             >'),
              ),
              onPressed: () {
                /*Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileSettings()),
                );*/
              },
            ),
          ),
            SizedBox(
              height: 60,
              child:RaisedButton(

                color: Colors.grey[100],
                child: Align(

                  alignment: Alignment.centerLeft,
                  child: Text('Lisanslar               '
                      '                  '
                      '                  '
                      '                  '
                      '            >'),
                ),
                onPressed: () {
                  /*Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileSettings()),
                );*/
                  showLicensePage(
                      context: context,
                      applicationName: 'WordApp',
                      applicationVersion: 'v1.0',
                      useRootNavigator: true
                  );
                },
              ),
            ),

        ],
      ),

      );


    }
  }

