import 'package:flutter/cupertino.dart';
import 'package:guzelamaingilizce/screens/words/wordgetter.dart';

Widget getCategoryName()
{
  if(currentCategory == null){
    return Text(
        "Category:?!"
    );
  }
  else
  {
    return Text(
      currentCategory,
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