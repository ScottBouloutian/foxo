import 'package:flutter/material.dart';
import 'home_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Foxo',
      theme: ThemeData(
        primaryColor: Colors.orange,
        primarySwatch: Colors.orange,
        primaryTextTheme: const TextTheme(
          titleLarge: TextStyle(
            color: Colors.white,
          ),
        ),
        textTheme: const TextTheme(
          titleMedium: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      home: const HomePage(title: 'Can you outsmart Foxo?'),
    );
  }
}
