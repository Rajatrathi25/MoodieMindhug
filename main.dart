import 'package:flutter/material.dart';
import 'package:mindhug/Screens/Loginscreen.dart';
import 'package:mindhug/Screens/Mainscreen.dart';
import 'package:mindhug/Screens/MoodSelector.dart';
import 'package:mindhug/Screens/Registerscreen.dart';
import 'package:mindhug/Screens/firstscreen.dart';
import 'package:mindhug/Screens/MoodSelector.dart';
import 'Screens/Mydiary.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: firstscreen(),
    );
  }
}

