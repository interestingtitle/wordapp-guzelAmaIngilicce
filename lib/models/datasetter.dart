import 'package:cloud_firestore/cloud_firestore.dart';


Future setterForData( var datalistTR, var datalistEN) async {
  int length = datalistTR.length;
  int lengthofStoredDocs;
  int index=0;
  await FirebaseFirestore.instance.collection("wordlist").doc("category").collection("vehicles").get().then((querySnapshot) {
    lengthofStoredDocs = querySnapshot.size;
    print(lengthofStoredDocs);
  });

  for(int i=lengthofStoredDocs+1; i<lengthofStoredDocs+1+length;i++){
    await FirebaseFirestore.instance.collection("wordlist").doc("category")
        .collection("vehicles").doc(i.toString())
        .set({
      "dataTR": datalistTR[index],
      "dataEN": datalistEN[index],
    });
    index++;
  }
}

Future deleteData(String collectionName) async{
  FirebaseFirestore.instance.collection("wordlist").doc("category").collection("vehicles").get().then((snapshot) {
      for (DocumentSnapshot ds in snapshot.docs){
      ds.reference.delete();
  }
  });
}