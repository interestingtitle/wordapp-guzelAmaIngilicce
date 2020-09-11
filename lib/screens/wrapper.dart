import 'package:flutter/material.dart';
import 'package:guzel_ama_ingilicce/screens/authenticate/authenticate.dart';
import 'package:guzel_ama_ingilicce/screens/home/home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    //return either home or authenticate
    return Authenticate();
  }
}