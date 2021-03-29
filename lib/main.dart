import 'package:flutter/material.dart';
import 'package:qq/screens/cityBanksList.dart';
import 'package:qq/screens/login.dart';
import 'package:qq/screens/BloodBankProfile.dart';
import 'package:qq/screens/test.dart';
import 'screens/bloodRequestForm.dart';
import 'screens/rquestList.dart';
import 'screens/UserProfile.dart';
import 'screens/articls.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:LoginScreen()//cityList(),
    );
  }
}
