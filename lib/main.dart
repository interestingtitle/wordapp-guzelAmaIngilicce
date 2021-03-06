import 'package:flutter/material.dart';
import 'package:guzelamaingilizce/models/user.dart';
import 'package:guzelamaingilizce/screens/words/wordgetter.dart';
import 'package:guzelamaingilizce/screens/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:guzelamaingilizce/services/auth.dart';
import 'package:guzelamaingilizce/services/connectivity.dart';
import 'package:provider/provider.dart';
import 'package:splashscreen/splashscreen.dart';
import 'dart:io';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await getWordList();
  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isInternetOn = true;
  void initState(){
    super.initState();
    connectivityDataGetter();
    listenConnection();

  }



  @override
  Widget build(BuildContext context) {
    Widget retryConnection = FlatButton(
      child: Text("Tekrar Dene"),
      onPressed:  () {
        connectivityDataGetter();
      },
    );
    Widget quitApp = FlatButton(
      child: Text("Çıkış"),
      onPressed:  () {
        exit(0);
      },
    );
    AlertDialog buildAlertDialog(){
      return AlertDialog(
        title: Text("Lütfen İnternete Bağlanın"),
        content: Text("Bağlantı Kurulamadı."),
        actions: [
          retryConnection,
          quitApp,
        ],
      );
    }
    if(isInternetOn == true){
      return new SplashScreen(
          seconds: 6,
          navigateAfterSeconds: new AfterSplash(),
          title: new Text('', style: TextStyle(color: Colors.black),),
          image: Image.asset('assets/it4.png',width: 137.0, height: 137.0,),
          backgroundColor: Colors.blue[100],
          styleTextUnderTheLoader: new TextStyle(),
          photoSize: 200.0,
          loaderColor: Colors.blue[800],
          loadingText:Text(""),

      );
    }else{
      return buildAlertDialog();

    }
  }


void connectivityDataGetter() async{
  bool conRes = await getConnectData(context);
    setState(() {
      isInternetOn = conRes;
  });

}
}


class AfterSplash extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return StreamProvider<CUser>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }

}
