
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
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:math';


List <WordData> wordList=new List();
class WordData
{
  String dataEN;
  String dataTR;
  WordData({this.dataEN,this.dataTR});
  @override
  String toString() {
    return 'WordData: {dataEN: ${dataEN}, dataTR: ${dataTR}}';
  }
}


class WordsTest extends StatefulWidget {

  @override
  _WordsTestState createState() => _WordsTestState();
}

Future<void> createWordData(String enValue,String trValue )
{
  WordData wordNew=new WordData(dataEN: enValue,dataTR: trValue);
  bool duplicate=false;
  wordList.forEach((element) {
    if(element.dataEN==wordNew.dataEN)
      {
        print("Duplicate record: "+element.dataEN);
        duplicate=true;
        return;
      }
  });
  if(!duplicate)
  wordList.add(wordNew);
  else
    return null;
}
Future <void> getWordList(int rnd) async
{
  await FirebaseFirestore.instance
      .collection('wordlist').doc('category').collection('fruits').doc(rnd.toString())
      .get()
      .then((value) async {
        await createWordData(value.get('dataEN').toString(),value.get('dataTR').toString());
      }
  );
}
Future <void> getRandomWordList() async
{
  Random random = new Random();
  int randomNumber = random.nextInt(15) + 1;
  await getWordList(randomNumber);
}
void printList()
{
  print("---------------------------");
  wordList.forEach((element) {
    print("-->"+element.dataTR + " " + element.dataEN);
  });
}
class _WordsTestState extends State<WordsTest> {
  @override
  Widget build(BuildContext context) {

    return Container(
      color: Colors.white,
      child:ListView(
        padding: new EdgeInsets.all(1.0),
        children: <Widget>[
        SizedBox(
        height: 200.0,
        child:RaisedButton(
          color:Colors.white,
          onPressed: () async{
            await getRandomWordList();
            printList();
          },
        ),
        ),
        SizedBox(
        height: 50.0,
        child:
        Text("hello"),

      ),
      ],
    ),
    );

  }
}