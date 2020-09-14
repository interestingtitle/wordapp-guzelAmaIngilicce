
import 'package:flutter/material.dart';
import 'package:guzel_ama_ingilicce/models/datasetter.dart';
import 'package:guzel_ama_ingilicce/models/variables.dart';
import 'package:guzel_ama_ingilicce/models/button.dart';
import 'package:guzel_ama_ingilicce/screens/words/wordgetter.dart';
import '';



class WordsTest extends StatefulWidget {

  @override
  _WordsTestState createState() => _WordsTestState();
}


class _WordsTestState extends State<WordsTest> {
  bool pressAttention = false;
  bool pressAttention2 = false;
  bool pressAttention3 = false;
  List<String> list1 = ["bisiklet","gemi"];
  List<String> list2 = ["cycle","ship"];


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
                  child:Text(wordList[0].dataTR.toString()),
                  color:Colors.white,
                  onPressed: () async{
                    await getRandomWordList();
                    printList();
                    setState(() {
                      optionA=wordList[0].dataEN.toString();
                      optionB=wordList[1].dataEN.toString();
                      optionC=wordList[2].dataEN.toString();

                      pressAttention=false;
                      pressAttention2 = false;
                      pressAttention3=false;
                    });
                    await setterForData(list1, list2);
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
                    color: pressAttention ? Colors.blue : Colors.grey,
                    onPressed: () async{
                      //await getRandomWordList();
                      printList();

                      setState(() {
                        pressAttention = true;
                        pressAttention2=false;
                        pressAttention3=false;

                      });
                      sleep1();
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
                    color: pressAttention2 ? Colors.blue : Colors.grey,
                    onPressed: () async{
                      //await getRandomWordList();
                      printList();

                      setState(() {


                        pressAttention=false;
                        pressAttention2 = true;
                        pressAttention3=false;
                      });
                      sleep1();
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
                    color: pressAttention3 ? Colors.blue : Colors.grey,
                    onPressed: () async{
                      //await getRandomWordList();
                      printList();

                      setState(()  {

                        pressAttention=false;
                        pressAttention2 =false;
                        pressAttention3=true;
                      });
                      sleep1();
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