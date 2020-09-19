import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math';

import 'package:guzel_ama_ingilicce/models/variables.dart';

List <WordData> wordList=new List();
List <Color> optionColorList=new List();
List allWordsWithCategories=new List<dynamic>();
List categoriesList=new List();
int wordListCount=0;
WordData chosenWord;
String currentCategory;
int categoryWordCount=5;
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
  WordData({this.dataEN,this.dataTR,this.category});
  @override
  String toString() {
    return 'WordData: {dataEN: $dataEN, dataTR: $dataTR,category:$category}';
  }
}
class WordDataList
{
  List <WordData> items=new List<WordData>();
  String categoryName;
  WordDataList({this.items,this.categoryName});
  @override
  String toString() {
    return 'WordDataList{category: $categoryName, items: $items}';
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
      chosenWord=wordList[rnd];

      //print("Chosen word: " +chosenWord);
      return rnd;
}

Future <void> getRandomWordList() async
{
  wordList.clear();
  wordListCount=0;

  String _setCategory='colors';

  for(int i=0;wordList.length<=2;i++) {
    Random random = new Random();
    int randomNumber = random.nextInt(10) + 1;
    await FirebaseFirestore.instance
        .collection('wordlist').doc('category').collection(_setCategory).doc(randomNumber.toString())
        .get()
        .then((value)  {
          //print("Getting data from server: "+i.toString());
      createWordData(value.get('dataEN').toString(),value.get('dataTR').toString());
    }
    );


  }
  currentCategory=_setCategory;
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
        _category=_listGrabber.elementAt(0).get('category');

        //print("Data-> "+_listGrabber.elementAt(i).get('dataEN'));
        //print("Data-> "+_listGrabber.elementAt(i).get('dataTR'));
        WordData _dummyWord=new WordData(dataEN:_listGrabber.elementAt(i).get('dataEN') ,dataTR: _listGrabber.elementAt(i).get('dataTR'),category:_category);
        _dummyList.add(_dummyWord);
        //print(_testWord);
      }
    categoriesList.add(_category);
    //print(_dummyList);
    WordDataList _dummyAllWords=new WordDataList(items:_dummyList,categoryName: _category);
    //print("Category: "+_dummyAllWords.categoryName);
    //print("Length: "+_dummyAllWords.items.length.toString());
    //print("Test: "+_dummyAllWords.items.elementAt(1).dataEN);
    allWordsWithCategories.addAll(_dummyList);
    //print(allWordsWithCategories[index-1]);
    print("Getting wordlist from database. Done.");
  }
}
void chooseRandomWord()
{
  var random=new Random();
  int rndIndex=random.nextInt(2)+0;
  chosenWord=wordList[rndIndex];
}

Future <void> pickRandomCategory() async
{
  List <WordData> _itemsFromCategory=new List<WordData>();
  var random=new Random();
  int rnd = random.nextInt(5)+0;
  //print(allWordsWithCategories);
  //print(rnd);
  var chosenCategory=categoriesList[rnd];
  _itemsFromCategory.clear();
  allWordsWithCategories.forEach((element) {
    //print(element.category);
    if(element.category==chosenCategory)
      {
        //print(element.category + chosenCategory);
        _itemsFromCategory.add(WordData(category: element.category,dataTR: element.dataTR,dataEN: element.dataEN));
      }


  }
  );
  currentCategory=_itemsFromCategory[0].category;
  int rndIndex=0;
  for(int i=0;i<=2;i++)
    {
      rndIndex = random.nextInt(_itemsFromCategory.length)+0;
      wordList[i]=_itemsFromCategory[rndIndex];
      //print(wordList[i]);
    }

  for (var i =2; i > 0; i--) {
    // Pick a pseudorandom number according to the list length
    var n = random.nextInt(i + 1);
    var temp = wordList[i];
    //print("Temp "+temp.toString());
    wordList[i] = wordList[n];
    wordList[n] = temp;
  }


  //print(_itemsFromCategory);
  //chooseRandomWord();
  print(wordList);
}