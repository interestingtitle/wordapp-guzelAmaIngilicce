import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});
  // collection reference
  final CollectionReference userCollection = FirebaseFirestore.instance.collection("users");
  final CollectionReference wordlistCollection = FirebaseFirestore.instance.collection("wordlist").doc("category").collection("fruits");
  final DocumentReference fruitDocument = FirebaseFirestore.instance.collection("wordlist").doc("category").collection("fruits").doc("1");
  Future updateUserData(String userName, int userPoint) async{
    return await userCollection.doc(uid).set({
      "userName": userName,
      "userPoint": userPoint,
    });
  }

  Stream<QuerySnapshot> get users{
    return userCollection.snapshots();
  }
  Stream<QuerySnapshot> get fruits{
    return wordlistCollection.snapshots();
  }


}