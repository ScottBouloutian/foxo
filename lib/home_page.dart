import 'package:flutter/material.dart';
import 'message.dart';
import 'score.dart';
import 'game_board.dart';
import 'game.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Game game;

  @override
  void initState() {
    super.initState();
    game = Game();
  }

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
            GameBoard(
              game: game,
            ),
            RaisedButton(
              child: const Text('Go Again'),
              onPressed: () {
                setState(() {
                  game = Game();
                });
              },
            ),
            Row(
              children: [
                Score(
                  title: 'Ties',
                  value: 0,
                ),
                Container(
                  child: Image.asset('images/foxo.png'),
                  width: 64,
                ),
                Score(
                  title: 'Wins',
                  value: 0,
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        ),
        padding: const EdgeInsets.all(20),
      ),
    );
  }
}
