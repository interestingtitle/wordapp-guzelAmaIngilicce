
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


List wordList=new List();
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
  wordList.add(wordNew);
  print(wordList);

}
Future <void> getWordList(int rnd) async
{

  FirebaseFirestore.instance
      .collection('wordlist').doc('category').collection('fruits').doc(rnd.toString())
      .get()
      .then((value) {
         createWordData(value.get('dataEN').toString(),value.get('dataTR').toString());
      }
  );
}
void getRandomWordList() async
{
  Random random = new Random();
  int randomNumber = random.nextInt(15) + 1;
  await getWordList(randomNumber);
}
void printList()
{
  print(wordList);
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
            getRandomWordList();
            printList();
          },
        ),

      ),
      ],
    ),
    );

  }
}


class LoadDataFromFirestore extends StatefulWidget {
  @override
  _LoadDataFromFirestoreState createState() => _LoadDataFromFirestoreState();
}

class _LoadDataFromFirestoreState extends State<LoadDataFromFirestore> {
  @override
  void initState() {
    super.initState();
    getDriversList().then((results) {
      setState(() {
        querySnapshot = results;
        var ab=querySnapshot;
      });
    });
  }

  QuerySnapshot querySnapshot;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _showDrivers(),
    );
  }

  //build widget as prefered
  //i'll be using a listview.builder
  Widget _showDrivers() {
    //check if querysnapshot is null
    if (querySnapshot != null) {
      return ListView.builder(
        primary: false,
        itemCount: querySnapshot.documents.length,
        padding: EdgeInsets.all(12),
        itemBuilder: (context, i) {
          return Column(
            children: <Widget>[
//load data into widgets
              //Text("${querySnapshot.docs[i].data['activation']}"),
              //Text("${querySnapshot.documents[i].data['car1']}"),
              //Text("${querySnapshot.documents[i].data['car2']}"),
              //Text("${querySnapshot.documents[i].data['car5']}"),
              //Text("${querySnapshot.documents[i].data['name']}"),
              //Text("${querySnapshot.documents[i].data['phone']}"),
            ],
          );
        },
      );
    } else {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
  }

  //get firestore instance
  getDriversList() async {
    final CollectionReference wordsCollection = FirebaseFirestore.instance.collection("wordlist").doc("category").collection("fruits");
    return wordsCollection.snapshots();
  }
  Stream<QuerySnapshot> get users{
    final CollectionReference wordsCollection = FirebaseFirestore.instance.collection("wordlist").doc("category").collection("fruits");
    return wordsCollection.snapshots();
  }
}