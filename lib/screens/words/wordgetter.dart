import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math';



List <WordData> wordList=new List();
class WordData
{
  String dataEN;
  String dataTR;
  WordData({this.dataEN,this.dataTR});
  @override
  String toString() {
    return 'WordData: {dataEN: ${dataEN}, dataTR: ${dataTR}}';
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
    wordList.add(wordNew);

}
Future <void> getWordList(int rnd) async
{
  try{
    await FirebaseFirestore.instance
        .collection('wordlist').doc('category').collection('fruits').doc(rnd.toString())
        .get()
        .then((value)  {
      createWordData(value.get('dataEN').toString(),value.get('dataTR').toString());
    }
    );
  }
  catch (e)
  {
    print("Cannot get data");
  }

}
Future <void> getRandomWordList() async
{
  wordList.clear();
  for(int _index=0;wordList.length<=2;_index++)
  {
    Random random = new Random();
    int randomNumber = random.nextInt(15) + 1;
    await getWordList(randomNumber);
  }
  if(wordList==null ||wordList.length<2)
  {
    print("Not enough word data");
  }

}
void printList()
{
  print("---------------------------");
  print("Length: "+wordList.length.toString());
  wordList.forEach((element) {
    print("-->"+element.dataTR + " " + element.dataEN);
  });
}