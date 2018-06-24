import 'package:flutter/material.dart';
import 'home_page.dart';

class App extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return new MaterialApp(
            title: 'Foxo',
            theme: new ThemeData(
                primarySwatch: Colors.orange,
                primaryTextTheme: new TextTheme(
                    title: new TextStyle(
                        color: Colors.white,
                    ),
                ),
                textTheme: new TextTheme(
                    title: new TextStyle(
                        color: Colors.black,
                    ),
                    subhead: new TextStyle(
                        color: Colors.green,
                    ),
                ),
            ),
            home: new HomePage(title: 'Foxo'),
        );
    }
}
