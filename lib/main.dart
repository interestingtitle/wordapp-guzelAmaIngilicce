import 'package:flutter/material.dart';
import 'package:guzel_ama_ingilicce/models/user.dart';
import 'package:guzel_ama_ingilicce/screens/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:guzel_ama_ingilicce/services/auth.dart';
import 'package:guzel_ama_ingilicce/services/connectivity.dart';
import 'package:provider/provider.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:connectivity/connectivity.dart';


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
    GetConnectData();
  }



  @override
  Widget build(BuildContext context) {
    if(isInternetOn == true){
      return new SplashScreen(
          seconds: 5,
          navigateAfterSeconds: new AfterSplash(),
          title: new Text('WordAPP', style: TextStyle(color: Colors.black),),
          image: Image.asset('assets/openingscene.gif',width: 128.0, height: 128.0,),
          backgroundColor: Colors.white,
          styleTextUnderTheLoader: new TextStyle(),
          photoSize: 200.0,
          loaderColor: Colors.white
      );
    }else{
      return buildAlertDialog();

    }
  }

  void GetConnectData() async{
    var connectivityResult = await (Connectivity().checkConnectivity());
    if(connectivityResult != ConnectivityResult.none)
      {
        setState(() {
          isInternetOn = true;
        });
      }
    else{
      isInternetOn = false;
    }
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
