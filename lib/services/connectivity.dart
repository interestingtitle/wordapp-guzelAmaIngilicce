import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';

AlertDialog buildAlertDialog(){
  return AlertDialog(
    title: Text("Uygulamayı Açmak İçin Lütfen İnternete Bağlanın"),
  );
}