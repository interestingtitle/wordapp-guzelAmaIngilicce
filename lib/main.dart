import 'package:flutter/material.dart';
import 'package:guzel_ama_ingilicce/screens/wrapper.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Wrapper(),
    );
  }
}
