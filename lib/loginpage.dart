import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
 import 'package:cloud_firestore/cloud_firestore.dart';

 //GOOGLE Provider
import 'package:google_sign_in/google_sign_in.dart';

//FACEBOOK PROVIDER
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  String _email;
  String _password;

  //google sign in
  GoogleSignIn googleAuth = new GoogleSignIn();

  //Facebook sign in
  FacebookLogin fbLogin = new FacebookLogin();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(25.0),
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(hintText: 'Email'),
              onChanged: (value) {
                setState(() {
                  _email = value;
                });
              },
            ),
            SizedBox(height: 15.0,),
            TextField(
              decoration: InputDecoration(hintText: 'Password'),
              onChanged: (value) {
                setState(() {
                  _password = value;
                });
              },
              obscureText: true,
            ),
            SizedBox(height:20),
            RaisedButton(
              child: Text('Login'),
              color: Colors.blue,
              textColor: Colors.white,
              elevation: 7.0,
              onPressed: (){
                 FirebaseAuth.instance
                  .signInWithEmailAndPassword(
                    email: _email,
                    password: _password)
                  .then(( user){ //FirebaseUser user
                      Navigator.of(context).pushReplacementNamed('/homepage');
                    })
                  .catchError((e){
                      print(e);
                    });
              },
            ),
            SizedBox(height: 15.0,),

            RaisedButton(
              child: Text('Login with facebook'),
              color: Colors.blue,
              textColor: Colors.white,
              elevation: 7.0,
              onPressed: () async {
//                fbLogin
//                    .logIn (['email','public_profile'])
//                    .then((result) {
//                      switch(result.status) {
//                        case FacebookLoginStatus.loggedIn:
//                          FirebaseAuth.instance.signInWithCredential(FacebookAuthProvider.getCredential(
//                              accessToken: result.accessToken.token).then((signedInUser) {
//                            print('Signed in as ${signedInUser.displayName}');
//                            Navigator.of(context).pushReplacementNamed('/homepage');
//
//                          }).catchError((e) {
//                            print(e);
//                          });
//                      }
//                    })
//                    .catchError((e) {
//                    print(e);
//                  });
              },
            ),
            SizedBox(height: 15.0,),

            //google sign in
            RaisedButton(
              child: Text('Login with Google'),
              color: Colors.blue,
              textColor: Colors.white,
              elevation: 7.0,
              onPressed: (){
//                googleAuth.signIn().then((result) {
//                  result.authentication.then((googleKey) {
//                    FirebaseAuth.instance.signInWithGoogle(
//                      idToken: googleKey.idToken,
//                      accessToken: googleKey.accessToken
//                    ).then((signedInUser) {
//                      print('Signed in as ${signedInUser.displayName}');
//                      Navigator.of(context).pushReplacementNamed('/homepage');
//                    }).catchError((e) {
//                      print(e);
//                    });
//                  }).catchError((e) {
//                    print(e);
//                  });
//                }).catchError((e) {
//                  print(e);
//                });
              },
            ),
            SizedBox(height: 15.0,),
            Text('Don\'t have an account?'),
            SizedBox(height: 10,),
            RaisedButton(
              child: Text('Sign Up'),
              color: Colors.blue,
              textColor: Colors.white,
              elevation: 7.0,
              onPressed: (){
                Navigator.of(context).pushReplacementNamed('/signup');
              })
          ],
        ),
        ) ,
      ),
    );
  }
}