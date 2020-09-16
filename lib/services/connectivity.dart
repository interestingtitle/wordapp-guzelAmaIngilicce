import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';




AlertDialog buildAlertDialog(){
  return AlertDialog(
    title: Text("Lütfen internete baglanınız."),
  );
}

Future<bool> GetConnectData(BuildContext context) async{
  var connectivityResult = await (Connectivity().checkConnectivity());
  if(connectivityResult != ConnectivityResult.none)
  {
    return true;
  }
  else{
    return false;
  }
}

