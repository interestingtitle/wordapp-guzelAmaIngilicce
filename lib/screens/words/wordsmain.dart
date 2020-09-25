
import 'package:flutter/material.dart';
import 'package:guzelamaingilizce/models/user.dart';
import 'package:guzelamaingilizce/screens/words/wordstest.dart';
import 'package:guzelamaingilizce/models/variables.dart';
import 'package:guzelamaingilizce/screens/words/wordgetter.dart';
import 'package:provider/provider.dart';
import 'package:guzelamaingilizce/services/auth.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:toast/toast.dart';
class Words extends StatefulWidget {
  @override
  _WordsState createState() => _WordsState();
}

class _WordsState extends State<Words> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<CUser>.value(
      value: AuthService().user,
      child: Container(
        color: Colors.blue[50],
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
                child: Text("Oyna"),
                color:Colors.white,
                onPressed: () async{
                  print(await DataConnectionChecker().hasConnection);
                  if(await DataConnectionChecker().hasConnection)
                    {
                      await getRandomWordList();
                      //await getWordList();
                      try{
                        optionA=wordList[0].dataEN.toString();
                        optionB=wordList[1].dataEN.toString();
                        optionC=wordList[2].dataEN.toString();
                        endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 60;
                        optionStatus="Seçim yapınız.";
                        setOptionColors();

                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => WordsTest()),
                        );


                      }
                      catch (e) {

                      }
                    }
                  else
                    {
                      Toast.show(
                          "İnternet'e bağlı değilsiniz.", context, duration: Toast.LENGTH_LONG,
                          gravity: Toast.BOTTOM);
                    }

                },
              ),
            ),

          ],
        ),
      ),
    );

  }
}
