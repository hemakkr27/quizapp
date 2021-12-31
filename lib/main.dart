import 'package:flutter/material.dart';

import 'FirstScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.orangeAccent),
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.redAccent,
          body: FirstHomeScreen(),
        ),
      ),
    );
  }
}

//    https://stackoverflow.com/questions/51991661/how-to-navigate-to-another-screen-from-dropdownbutton-in-flutter

// main--> AllData ->
// 1) start quiz - direct open  (  FirstHomeScreen(),)
// 2) Categories --> Onescreen  --> MAINSCREEN
// 3) 