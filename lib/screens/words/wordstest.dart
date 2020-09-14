import 'dart:io';
import 'package:flutter/material.dart';
import 'package:guzel_ama_ingilicce/models/variables.dart';
import 'package:guzel_ama_ingilicce/models/button.dart';
import 'package:guzel_ama_ingilicce/screens/words/wordgetter.dart';



class WordsTest extends StatefulWidget {

  @override
  _WordsTestState createState() => _WordsTestState();
}
void getAnswer(int optionIndex,String word) async
{
      optionColorList[1]=Colors.grey;
      optionColorList[2]=Colors.grey;
      optionColorList[3]=Colors.grey;
      print(optionIndex.toString()+word);
      if(wordList[0].dataEN.toString()== word)
        {
          print("Correct Answer");
          optionColorList[optionIndex]=Colors.green;
          for(int i=1;i<=3;i++)
            {
              if(optionColorList[i]==Colors.green)
                {

                }
              else
                {
                  optionColorList[i]=Colors.grey;
                }

            }
          print(optionIndex);

        }
      else if(word=="none")
        {
          optionColorList[1]=Colors.grey;
          optionColorList[2]=Colors.grey;
          optionColorList[3]=Colors.grey;
        }
      else
        {
          print("Wrong Answer");
          optionColorList[optionIndex]=Colors.red;
          for(int i=1;i<=3;i++)
          {
            if(optionColorList[i]==Colors.red && optionColorList[optionIndex]==Colors.red)
            {

            }
            else
            {
              optionColorList[i]=Colors.grey;
            }

          }
          print(optionIndex);
        }

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
                      //await getRandomWordList();
                      printList();
                      await getRandomWordList();
                      printList();
                      setState(() {
                        optionA=wordList[0].dataEN.toString();
                        optionB=wordList[1].dataEN.toString();
                        optionC=wordList[2].dataEN.toString();


                        getAnswer(1, "optionA");
                      });

                      await Future.delayed(const Duration(seconds: 5), () {
                        setState(() {
                          optionColorList[1]=Colors.grey;
                          optionColorList[2]=Colors.grey;
                          optionColorList[3]=Colors.grey;
                          print("anana atlayam");
                        });

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
                    color: optionColorList[2],
                    onPressed: () async{
                      //await getRandomWordList();
                      printList();

                      setState(() {



                        getAnswer(2,optionB);
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
                    color: optionColorList[3],
                    onPressed: () async{
                      //await getRandomWordList();
                      printList();

                      setState(()  {


                        getAnswer(3,optionC);
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