import 'package:flutter/material.dart';

class Score extends StatefulWidget {
  Score({Key key, this.title, this.value}) : super(key: key);

  final String title;
  final int value;

  @override
  _ScoreState createState() => _ScoreState();
}

class _ScoreState extends State<Score> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          widget.value.toString(),
          style: TextStyle(fontSize: 32),
        ),
        Text(
          widget.title,
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
