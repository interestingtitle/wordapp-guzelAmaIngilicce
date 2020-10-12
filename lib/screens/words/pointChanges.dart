import 'package:flutter/cupertino.dart';
import 'package:guzelamaingilizce/screens/words/wordgetter.dart';

Widget getCategoryName()
{
  if(currentCategory == null){
    return Text(
        "Category:?!",
      style: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),

    );
  }
  else
  {
    return Text(
      currentCategory,
      style: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
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