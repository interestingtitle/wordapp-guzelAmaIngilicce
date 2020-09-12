import 'package:flutter/material.dart';
import 'package:guzel_ama_ingilicce/models/user.dart';
import 'package:guzel_ama_ingilicce/screens/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:guzel_ama_ingilicce/services/auth.dart';
import 'package:provider/provider.dart';
Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
