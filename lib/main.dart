import 'package:flutter/material.dart';
import 'package:flutter_firestore/services/authservice.dart';

//pages
import 'homepage.dart';
import 'loginpage.dart';
import 'signuppage.dart';
import 'phoneauthentication.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthService().hadleAuth(),
      routes: <String, WidgetBuilder> {
        '/landingpage' : (BuildContext context) => new MyApp(),
        '/signup' : (BuildContext context) => new SignupPage(),
        '/homepage' : (BuildContext context) => new HomePage(),
      },
    );
  }
}
