import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:guzel_ama_ingilicce/models/variables.dart';
import 'package:guzel_ama_ingilicce/models/button.dart';
import 'package:guzel_ama_ingilicce/screens/words/wordgetter.dart';
import 'package:toast/toast.dart';
import 'package:flutter_countdown_timer/countdown_timer.dart';

class WordsTest extends StatefulWidget {

  @override
  _WordsTestState createState() => _WordsTestState();

}

class _WordsTestState extends State<WordsTest> {


  void getAnswer(int optionIndex,String word) async
  {
    optionColorList[1] = Colors.grey[150];
    optionColorList[2] = Colors.grey[150];
    optionColorList[3] = Colors.grey[150];
    //print(optionIndex.toString()+word);
    if (chosenWord == word) {
      //print("Correct Answer");
      Toast.show(
          "Tebrikler! Doğru cevap.", context, duration: Toast.LENGTH_SHORT,
          gravity: Toast.BOTTOM);
      optionColorList[4]=Colors.green;
      optionStatus="İyi gidiyorsun!: "+chosenWord;
      //print(optionIndex);
    }
    else if (word == "none") {
      optionColorList[1] = Colors.grey[150];
      optionColorList[2] = Colors.grey[150];
      optionColorList[3] = Colors.grey[150];
    }
    else {
      //print("Wrong Answer");
      Toast.show(
          "Üzgünüm, yanlış cevap.", context, duration: Toast.LENGTH_SHORT,
          gravity: Toast.BOTTOM);
      optionStatus="Yanlış cevap: "+chosenWord;

      optionColorList[4]=Colors.red;
    }
  }

    @override
  Widget build(BuildContext context) {

      Timer(Duration(seconds: 120), () {

        Navigator.pop(context);
      });
    return Scaffold(
        appBar: AppBar(),
        body:Container(
          color: Colors.white,
          child:ListView(
            padding: new EdgeInsets.all(1.0),
            children: <Widget>[
              SizedBox(
                height: 50,
                child: Text("Test"),
              ),
                SizedBox(
                  height: 200.0,
                  child: RaisedButton(
                    child: Text(wordList[randomInt()].dataTR.toString()),
                    color: optionColorList[0],
                    onPressed: () async {
                      await getRandomWordList();
                      //printList();
                      setState(() {
                        optionA = wordList[0].dataEN.toString();
                        optionB = wordList[1].dataEN.toString();
                        optionC = wordList[2].dataEN.toString();
                        getAnswer(0, "none");

                      });
                    },
                  ),
                ),


                SizedBox(
                  height: 75,
                ),


                Container(
                  child: SizedBox(
                    height: 75,
                    child: RaisedButton(
                      child: Text(optionA),
                      color: optionColorList[1],
                      shape: StadiumBorder(),
                      onPressed: () async {
                        getAnswer(1, optionA);
                        await getRandomWordList();
                        //printList();
                        //await getRandomWordList();
                        //printList();
                        setState(() {
                          optionA = wordList[0].dataEN.toString();
                          optionB = wordList[1].dataEN.toString();
                          optionC = wordList[2].dataEN.toString();

                        });
                      },
                    ),
                  ),
                ),
                    SizedBox(
                      height: 5
                    ),
                Container(
                  child: SizedBox(
                    height: 75,
                    child: RaisedButton(
                      child: Text(optionB),
                      color: optionColorList[3],
                      shape: StadiumBorder(),
                      onPressed: () async {
                        getAnswer(2, optionB);
                        await getRandomWordList();
                        setState(() {
                          optionA = wordList[0].dataEN.toString();
                          optionB = wordList[1].dataEN.toString();
                          optionC = wordList[2].dataEN.toString();

                        });
                      },

                    ),
                  ),
                ),

              SizedBox(
                  height: 5
              ),


                Container(
                  child: SizedBox(
                    height: 75,
                    child: RaisedButton(
                      child: Text(optionC),
                      color: optionColorList[3],
                      shape: StadiumBorder(),
                      onPressed: () async {
                        getAnswer(3, optionC);
                        await getRandomWordList();

                        //printList();
                        setState(() {
                          optionA = wordList[0].dataEN.toString();
                          optionB = wordList[1].dataEN.toString();
                          optionC = wordList[2].dataEN.toString();

                        });
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
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
                    height: 150,
                    child: RaisedButton(
                      child: Text(optionStatus),
                      color: optionColorList[4],
                      onPressed: () {
                        //printList();
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