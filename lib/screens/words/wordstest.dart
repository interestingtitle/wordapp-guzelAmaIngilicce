
import 'package:flutter/material.dart';
import 'package:guzel_ama_ingilicce/models/variables.dart';
import 'package:guzel_ama_ingilicce/models/button.dart';
import 'package:guzel_ama_ingilicce/screens/words/wordgetter.dart';



class WordsTest extends StatefulWidget {

  @override
  _WordsTestState createState() => _WordsTestState();
}

class _WordsTestState extends State<WordsTest> {
  bool pressAttention = false;
  bool pressAttention2 = false;
  bool pressAttention3 = false;
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
                  color:optionColorList[0],
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
                        getAnswer(0, "none");

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
                    color:optionColorList[1],

                    onPressed: () async{

                      setState(() {
                        pressAttention = true;
                        pressAttention2=false;
                        pressAttention3=false;
                        getAnswer(1,optionA);


                        //printList();
                      });
                      //sleep1();
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
                    color: optionColorList[2],
                    onPressed: () async{
                      //await getRandomWordList();
                      //printList();

                      setState(() {


                        pressAttention=false;
                        pressAttention2 = true;
                        pressAttention3=false;
                        getAnswer(2,optionB);
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
                    color: optionColorList[3],
                    onPressed: () async{
                      //await getRandomWordList();
                      //printList();

                      setState(()  {

                        pressAttention=false;
                        pressAttention2 =false;
                        pressAttention3=true;
                        getAnswer(3,optionC);
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