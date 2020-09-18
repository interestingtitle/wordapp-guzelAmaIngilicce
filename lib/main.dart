import 'package:flutter/material.dart';
import 'package:guzel_ama_ingilicce/models/user.dart';
import 'package:guzel_ama_ingilicce/screens/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:guzel_ama_ingilicce/services/auth.dart';
import 'package:guzel_ama_ingilicce/services/connectivity.dart';
import 'package:provider/provider.dart';
import 'package:splashscreen/splashscreen.dart';
import 'dart:io';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
        title: Text("Uygulamayı Açmak İçin Lütfen İnternete Bağlanın"),
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
          title: new Text('Güzel Ama İngiliççe', style: TextStyle(color: Colors.black),),
          image: Image.asset('assets/openingscene.gif',width: 128.0, height: 128.0,),
          backgroundColor: Colors.white,
          styleTextUnderTheLoader: new TextStyle(),
          photoSize: 200.0,
          loaderColor: Colors.white,
          loadingText: Text("Yükleniyor...",style: TextStyle(color: Colors.black),),

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
