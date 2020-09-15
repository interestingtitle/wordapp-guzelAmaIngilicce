import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math';

List <WordData> wordList=new List();
List <Color> optionColorList=new List();
int wordListCount=0;
String chosenWord="";
void setOptionColors()
{
  Color colorQuestion=Colors.lightGreen[200];
  Color colorA=Colors.grey[150];
  Color colorB=Colors.grey[150];
  Color colorC=Colors.grey[150];
  Color colorD=Colors.lightBlue;
  optionColorList.clear();
  optionColorList.add(colorQuestion);
  optionColorList.add(colorA);
  optionColorList.add(colorB);
  optionColorList.add(colorC);
  optionColorList.add(colorD);
}
class WordData
{
  String dataEN;
  String dataTR;
  WordData({this.dataEN,this.dataTR});
  @override
  String toString() {
    return 'WordData: {dataEN: $dataEN, dataTR: $dataTR}';
  }
}

void createWordData(String enValue,String trValue )
{
  WordData wordNew=new WordData(dataEN: enValue,dataTR: trValue);
  bool duplicate=false;

  wordList.forEach((element) {
    if(element.dataEN==wordNew.dataEN)
    {
      print("Duplicate record: "+element.dataEN);
      duplicate=true;
      return;
    }
  });
  if(!duplicate)
    {
      if(wordListCount<=2)
        {
          wordList.add(wordNew);
          wordListCount++;
        }

      //print("List count:" + wordListCount.toString());
    }


}
int randomInt()
{
      var random=new Random();
      int rnd = random.nextInt(3)+0;
      //print(rnd.toString());
      chosenWord=wordList[rnd].dataEN;
      print("Chosen word: " +chosenWord);
      return rnd;

}


Future <void> getRandomWordList() async
{
  wordList.clear();
  wordListCount=0;
  for(int i=0;wordList.length<=2;i++) {
    Random random = new Random();
    int randomNumber = random.nextInt(24) + 1;
    await FirebaseFirestore.instance
        .collection('wordlist').doc('category').collection('fruits').doc(randomNumber.toString())
        .get()
        .then((value)  {
          //print("Getting data from server: "+i.toString());
      createWordData(value.get('dataEN').toString(),value.get('dataTR').toString());
    }
    );
  }
  //print(wordList);
  var random = new Random();

  // Go through all elements.
  for (var i =2; i > 0; i--) {

    // Pick a pseudorandom number according to the list length
    var n = random.nextInt(i + 1);
    var temp = wordList[i];
    //print("Temp "+temp.toString());
    wordList[i] = wordList[n];
    wordList[n] = temp;

  }

  //print(wordList);

}
void printList()
{
  print("---------------------------");
  print("Length: "+wordList.length.toString());
  wordList.forEach((element) {
    print("-->"+element.dataTR + " " + element.dataEN);
  });
}

