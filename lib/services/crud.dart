import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class crudMedthods {
  bool isLoggedIn() {
    if(FirebaseAuth.instance.currentUser() != null) {
      return true;
    }else {
      return false;
    }
  }

  Future<void> addData(carData) async {
    if(isLoggedIn()) {
      print('hi crud');
      Firestore.instance
          .collection('testcrud')
          .add(carData)
          .catchError((e) {
            print('hi error crud on addData');
            print(e);
          }
      );
    }
      //======= Good way. In production this is efficient===
//      Firestore.instance.runTransaction((Transaction crudTransaction) async {
//        CollectionReference reference = await Firestore.instance.collection('testcrud');
//
//        reference.add(carData);
//        print('added data into database');
//      });
//    }else {
//      print('You need to be logged in');
//    }
  }
  
  getData() async {
//    return await Firestore.instance.collection('testcrud').getDocuments();
    return await Firestore.instance.collection('testcrud').snapshots(); //this return string
  }

  updateData(selectedDoc, newValues) {
    Firestore.instance
        .collection('testcrud')
        .document(selectedDoc)
        .updateData(newValues)
        .catchError((e){
          print(e);
          print('error in update');
    });
  }

  deleteData(docId) {
    Firestore.instance
        .collection('testcrud')
        .document(docId)
        .delete()
        .catchError((e){
          print(e);
          print('eeror in deleting from database');
    });
  }

}
