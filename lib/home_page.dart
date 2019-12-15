import 'package:flutter/material.dart';
import 'message.dart';
import 'score.dart';
import 'game_board.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        child: Column(
          children: [
            Message(),
            GameBoard(),
            Row(
              children: [
                Expanded(
                  child: Score(
                    title: 'Ties',
                    value: 0,
                  ),
                ),
                Container(
                  child: Image.asset('images/foxo.png'),
                  width: 64,
                ),
                Expanded(
                  child: Score(
                    title: 'Wins',
                    value: 0,
                  ),
                ),
              ],
            ),
          ],
        ),
        padding: const EdgeInsets.all(20),
      ),
    );
  }
}
