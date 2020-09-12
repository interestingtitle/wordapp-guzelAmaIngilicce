import 'package:flutter/material.dart';
import 'package:guzel_ama_ingilicce/models/user.dart';
import 'package:guzel_ama_ingilicce/screens/authenticate/authenticate.dart';
import 'package:guzel_ama_ingilicce/screens/home/home.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<CUser>(context);
    //return either home or authenticate
    if(user != null)
      return Home();
    else
      return Authenticate();
  }
}