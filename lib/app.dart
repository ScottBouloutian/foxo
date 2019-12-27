import 'package:flutter/material.dart';
import 'home_page.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Foxo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        primaryTextTheme: TextTheme(
          title: TextStyle(
              color: Colors.white,
          ),
        ),
        textTheme: TextTheme(
          title: TextStyle(
              color: Colors.black,
          ),
          subhead: TextStyle(
              color: Colors.green,
          ),
        ),
      ),
      home: HomePage(title: 'Foxo'),
    );
  }
}
