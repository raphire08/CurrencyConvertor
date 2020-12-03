import 'package:flutter/material.dart';
import 'package:sivisoft/screen/loadingScreen.dart';
import 'package:sivisoft/screen/loginScreen.dart';
import 'package:sivisoft/screen/compareCurrencyScreen.dart';
import 'package:sivisoft/screen/baseCurrencyScreen.dart';
import 'package:sivisoft/screen/resultScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //final Future<FirebaseApp> initialization = Firebase.initializeApp();
    return MaterialApp(
      title: 'Sivisoft Currency Converter',
      initialRoute: 'loadingScreen',
      routes: {
        'loadingScreen': (BuildContext context) => LoadingScreen(),
        'loginScreen': (BuildContext context) => LoginScreen(),
        'baseCurrencyScreen': (BuildContext context) => BaseCurrencyScreen(),
        'compareCurrencyScreen': (BuildContext context) =>
            CompareCurrencyScreen(),
        'resultScreen': (BuildContext context) => ResultScreen(),
      },
    );
  }
}
