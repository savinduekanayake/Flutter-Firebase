import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';

class UserManagement {

  storeNewUser(user, context) {
//    debugPrint(user.email +
//        "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
//    debugPrint(user.uid +
//        "bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb");
//    Firestore.instance.collection('users').add({
//      'email': "llll",
//      'uid': "njbjjb",
//    }).then((value) {
//      Navigator.of(context).pop();
//      Navigator.of(context).pushReplacementNamed(('/homepage'));
//    }).catchError((onError) {
//      debugPrint("ccccc" * 1000);
//      print(onError);
//    });

    Firestore.instance
        .collection("users")
        .document('grger')
        .setData({
      "uid": 'herh',
      "email": 'dyherw',
    });
  }
}
