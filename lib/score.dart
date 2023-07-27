import 'package:flutter/material.dart';

class Score extends StatefulWidget {
  const Score({
    super.key,
    required this.title,
    required this.value,
  });

  final String title;
  final int value;

  @override
  ScoreState createState() => ScoreState();
}

class ScoreState extends State<Score> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          widget.value.toString(),
          style: const TextStyle(fontSize: 32),
        ),
        Text(
          widget.title,
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
