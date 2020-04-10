import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firestore/screens/dashboard.dart';
import 'package:flutter_firestore/screens/phoneauthentication.dart';


class AuthService {

  //Handles Auth
  hadleAuth(){
    return StreamBuilder(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (BuildContext context, snapshot){
        if(snapshot.hasData) {
          return DashboardPage();
        }else {
          return PhoneAuthenticationPage();
        }
      },
    );
  }


  //Sign out
  signOut() {
    FirebaseAuth.instance.signOut();
  }


  //Sign In
  signIn(AuthCredential authcred){
    FirebaseAuth.instance.signInWithCredential(authcred);
  }

  signInWithOTP(smscode,verId){
    AuthCredential authCreds = PhoneAuthProvider.getCredential(
        verificationId: verId,
        smsCode: smscode
    );
    signIn(authCreds);
  }


}