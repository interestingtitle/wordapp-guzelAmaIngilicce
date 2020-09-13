
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

void createWordData(String enValue,String trValue )
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

}
Future <void> getWordList(int rnd) async
{
  try{
    await FirebaseFirestore.instance
        .collection('wordlist').doc('category').collection('fruits').doc(rnd.toString())
        .get()
        .then((value)  {
       createWordData(value.get('dataEN').toString(),value.get('dataTR').toString());
    }
    );
  }
  catch (e)
  {
    print("Cannot get data");
  }

}
Future <void> getRandomWordList() async
{
  wordList.clear();
  for(int _index=0;wordList.length<=2;_index++)
    {
      Random random = new Random();
      int randomNumber = random.nextInt(15) + 1;
      await getWordList(randomNumber);
    }
  if(wordList==null ||wordList.length<2)
    {
      print("Not enough word data");
    }

}
void printList()
{
  print("---------------------------");
  print("Length: "+wordList.length.toString());
  wordList.forEach((element) {
    print("-->"+element.dataTR + " " + element.dataEN);
  });
}
class _WordsTestState extends State<WordsTest> {
  String optionA="A";
  String optionB="B";
  String optionC="C";
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:Container(
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
                  setState(() {
                    optionA=wordList[0].dataEN.toString();
                    optionB=wordList[1].dataEN.toString();
                    optionC=wordList[2].dataEN.toString();
                  });
                },
              ),
            ),

            Container(
              decoration:
              BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  width: 1,
                ),
              ),
              child: SizedBox(
                height: 100,
                child: RaisedButton(
                  child: Text(optionA),
                  color:Colors.white,
                  onPressed: () async{
                    await getRandomWordList();
                    printList();
                      setState(() {
                        optionA=wordList[0].dataEN.toString();
                      });
                  },
                ),
              ),
            ),
            Container(
              decoration:
              BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  width: 1,
                ),
              ),
              child: SizedBox(
                height: 100,
                child: RaisedButton(
                  child: Text(optionB),
                  color:Colors.white,
                  onPressed: () async{
                    await getRandomWordList();
                    printList();
                      setState(() {

                      });
                  },
                ),
              ),
            ),
            Container(
              decoration:
              BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  width: 1,
                ),
              ),
              child: SizedBox(
                height: 100,
                child: RaisedButton(
                  child: Text(optionC),
                  color:Colors.white,
                  onPressed: () async{
                    await getRandomWordList();
                    printList();
                    setState(() {
                      optionC=wordList[1].dataEN.toString();
                    });
                  },
                ),
              ),
            ),




          ],
        ),
      )

    );
  }
}