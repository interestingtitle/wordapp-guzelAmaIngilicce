
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:guzelamaingilizce/screens/words/pointChanges.dart';
import 'package:flutter/material.dart';
import 'package:guzelamaingilizce/models/variables.dart';
import 'package:guzelamaingilizce/screens/words/wordgetter.dart';
import 'package:guzelamaingilizce/services/database.dart';
import 'package:toast/toast.dart';
import 'package:flutter_countdown_timer/countdown_timer.dart';
import 'package:guzelamaingilizce/services/connectivity.dart';
import 'package:data_connection_checker/data_connection_checker.dart';


class WordsTest extends StatefulWidget {

  @override
  _WordsTestState createState() => _WordsTestState();

}

class _WordsTestState extends State<WordsTest> {
  String currentPointForUser;
  int _currentPointForUser2;
  int _additionPoint = 10;
  User _asd = FirebaseAuth.instance.currentUser;
  bool isInternetOn = true;
  void initState(){
    super.initState();
    connectivityDataGetter();
  }

  Future<void> getAnswer(int optionIndex,String word) async
  {
    //print("->"+word);
    if(await DataConnectionChecker().hasConnection){
      await FirebaseFirestore.instance.collection("users").doc(_asd.uid.toString()).get().then((value){
        currentPointForUser = value.get("userPoint").toString();
      });
      _currentPointForUser2 = int.parse(currentPointForUser);


      optionColorList[1] = Colors.grey[150];
      optionColorList[2] = Colors.grey[150];
      optionColorList[3] = Colors.grey[150];
      //print(optionIndex.toString()+word);
      //print(chosenWord.dataEN);
      if (chosenWord.dataEN== word) {
        //print("Correct Answer");

        _currentPointForUser2= _currentPointForUser2+_additionPoint;
        await DatabaseService(uid: _asd.uid).updateUserPoint(_currentPointForUser2);
        Toast.show(
            "Tebrikler! Doğru cevap.", context, duration: Toast.LENGTH_SHORT,
            gravity: Toast.BOTTOM);
        optionColorList[4]=Colors.green;
        optionStatus="İyi gidiyorsun!: "+chosenWord.dataTR;
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
        optionStatus="Yanlış cevap: "+chosenWord.dataTR;

        optionColorList[4]=Colors.red;
      }
      pickRandomCategory();
    }
  else
    {
      Navigator.of(context).pop();
      Toast.show(
          "İnternet'e bağlı değilsiniz.", context, duration: Toast.LENGTH_LONG,
          gravity: Toast.BOTTOM);
    }
  }

    @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(),
        body:Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,

            children: <Widget>[
              Expanded(
                flex: 4,
                child: Row(
                  children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: CountdownTimer(endTime: endTime,
                        onEnd: (){
                          print("Time over");
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: getCategoryName(),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: pointChanges(_currentPointForUser2),
                      ),
                    ),

                  ],
                ),
              ),

                Expanded(
                  flex: 10,
                  child: RaisedButton(
                    child: Text(wordList[randomInt(0,3)].dataTR.toString()),
                    //child: Text(chosenWord.dataTR),
                    color: optionColorList[0],
                    onPressed: () async {
                      //await getRandomWordList();
                      chooseRandomWord();
                      pickRandomCategory();
                      //printList();
                      //await getWordList();
                      setState((){
                        optionA = wordList[0].dataEN.toString();
                        optionB = wordList[1].dataEN.toString();
                        optionC = wordList[2].dataEN.toString();
                        getAnswer(0, "none");

                      });
                    },
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: RaisedButton(
                    child: Text(optionA),
                    color: optionColorList[1],
                    shape: StadiumBorder(),
                    onPressed: () async {

                      //await getRandomWordList();
                      await getAnswer(1, optionA);

                      //await pickRandomCategory();



                      setState(() {
                        optionA = wordList[0].dataEN.toString();
                        optionB = wordList[1].dataEN.toString();
                        optionC = wordList[2].dataEN.toString();

                      });

                    },
                  ),
                ),

                Expanded(
                  flex: 5,
                  child: RaisedButton(
                    child: Text(optionB),
                    color: optionColorList[3],
                    shape: StadiumBorder(),
                    onPressed: () async {

                      //await getRandomWordList();
                      await getAnswer(2, optionB);
                      //await pickRandomCategory();



                      setState(() {
                        optionA = wordList[0].dataEN.toString();
                        optionB = wordList[1].dataEN.toString();
                        optionC = wordList[2].dataEN.toString();

                      });
                    },


                  ),
                ),
                Expanded(
                  flex: 5,
                  child: RaisedButton(
                    child: Text(optionC),
                    color: optionColorList[3],
                    shape: StadiumBorder(),
                    onPressed: () async {

                      await getAnswer(3, optionC);
                      //await pickRandomCategory();

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

                Expanded(
                  flex: 10,
                  child: RaisedButton(

                    child: Text(optionStatus),
                    color: optionColorList[4],
                    onPressed: () {
                      //printList();
                    },

                  ),
                ),

            ],

        )

    );
  }
  void connectivityDataGetter() async {
    bool conRes = await getConnectData(context);

    setState(() {
      isInternetOn = conRes;
    });
  }
}