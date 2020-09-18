import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math';

import 'package:guzel_ama_ingilicce/models/variables.dart';

List <WordData> wordList=new List();
List <Color> optionColorList=new List();
List<WordDataList> allWordsWithCategories=new List();
int wordListCount=0;
String chosenWord="";
String currentCategory;
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
  String category;
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
int randomInt(int a,int b)
{
      var random=new Random();
      int rnd = random.nextInt(b)+a;
      chosenWord=wordList[rnd].dataEN;
      //print("Chosen word: " +chosenWord);
      return rnd;

}

Future <void> getRandomWordList() async
{
  wordList.clear();
  wordListCount=0;
  for(int i=0;wordList.length<=2;i++) {
    Random random = new Random();
    int randomNumber = random.nextInt(16) + 1;
    await FirebaseFirestore.instance
        .collection('wordlist').doc('category').collection('colors').doc(randomNumber.toString())
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

class WordDataList
{
  List <WordData> items;
  String categoryName;
  WordDataList({this.items,this.categoryName});
  @override
  String toString() {
    return 'WordDataList{category: $categoryName, items: $items}';
  }
}

Future<void> getWordList() async
{
  allWordsWithCategories.clear();
  var _listGrabber= new List(); // Getting all collections from database.
  List <WordData> _dummyList=new List();// Creating WordData list for separating categories.
  String _category;
  for(int index=1;index<=5;index++) { // 1 to Max Categories
    _dummyList.clear();
    _listGrabber.clear();
    await FirebaseFirestore.instance
        .collection('wordlist').doc('category').collection(index.toString())
        .get().then((value) {
      _listGrabber=value.docs.toList(); // Getting all collections separated by categories.
    });

    //print(_category);
    //print("Length: "+_listGrabber.length.toString());
    //print("Category:"+_listGrabber.elementAt(0).get('category'));
    for(int i=1;i<_listGrabber.length;i++)
      {
        //print("Data-> "+_listGrabber.elementAt(i).get('dataEN'));
        //print("Data-> "+_listGrabber.elementAt(i).get('dataTR'));
        WordData _dummyWord=new WordData(dataEN:_listGrabber.elementAt(i).get('dataEN') ,dataTR: _listGrabber.elementAt(i).get('dataTR'));
        _dummyList.add(_dummyWord);
        //print(_testWord);
      }
    _category=_listGrabber.elementAt(0).get('category');
    //print(_category);
    //print(_listGrabber.elementAt(1).get('dataEN'));
    WordDataList _dummyAllWords=new WordDataList(items:_dummyList,categoryName: _category); //Initialize allWordsWithCategories
    //print("Category: "+_dummyAllWords.categoryName);
    //print("Length: "+_dummyAllWords.items.length.toString());
    //print("Test: "+_dummyAllWords.items.elementAt(1).dataEN);
    allWordsWithCategories.add(_dummyAllWords);
    //print(allWordsWithCategories[index-1]);
    _dummyList.clear();
    _dummyAllWords=null;
    _listGrabber.clear();
  }
}

void pickRandomCategory()
{
  var random=new Random();
  int rnd = random.nextInt(5)+0;
  //print(allWordsWithCategories);
  //print(rnd);
  WordDataList _chosenCategoryList=allWordsWithCategories[0];
  print(_chosenCategoryList);
  _chosenCategoryList=allWordsWithCategories[1];
  print(_chosenCategoryList);

}