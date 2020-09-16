import 'package:flutter/cupertino.dart';

Widget pointChanges(int point){
  if(point == null){
    return Text(
        "Puan Kazanmak İçin Cevapla!"
    );
  }
  else
    {
      return Text(
        "Puanınız: " + point.toString(),

      );
    }

}