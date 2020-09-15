import 'dart:async';

import 'package:flutter/material.dart';
import 'package:guzel_ama_ingilicce/screens/words/wordstest.dart';
import 'package:guzel_ama_ingilicce/models/variables.dart';
import 'package:guzel_ama_ingilicce/screens/words/wordgetter.dart';

class Words extends StatefulWidget {
  @override
  _WordsState createState() => _WordsState();
}

class _WordsState extends State<Words> {
  @override
  Widget build(BuildContext context) {
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
            height: 60.0,
            child:RaisedButton(
              child: Text("Play"),
              color:Colors.white,
              onPressed: () async{
                await getRandomWordList();
                try{
                  optionA=wordList[0].dataEN.toString();
                  optionB=wordList[1].dataEN.toString();
                  optionC=wordList[2].dataEN.toString();
                  endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 30;
                  optionStatus="Seçim yapınız.";
                  setOptionColors();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WordsTest()),
                  );


                }
                catch (e) {

                }
              },
            ),
          ),

        ],
      ),
    );

  }
}
