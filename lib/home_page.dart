import 'package:flutter/material.dart';
import 'message.dart';
import 'score.dart';
import 'game_board.dart';
import 'game.dart';
import 'enums.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool moveFoxo;
  Game game;
  int ties;
  int wins;

  @override
  void initState() {
    super.initState();
    moveFoxo = true;
    game = Game(moveFoxo);
    ties = 0;
    wins = 0;
  }

  Widget buildResetButton() {
    final winner = game.findGameState();
    return AnimatedOpacity(
      child: RaisedButton(
        child: const Text('Try Again'),
        color: Theme.of(context).primaryColor,
        textColor: Theme.of(context).primaryTextTheme.title.color,
        onPressed: () {
          setState(() {
            moveFoxo = !moveFoxo;
            game = Game(moveFoxo);
          });
        },
      ),
      duration: const Duration(milliseconds: 500),
      opacity: winner == null ? 0 : 1,
    );
  }

  Widget buildFooter() {
    return Row(
      children: [
        Score(
          title: 'Ties',
          value: ties,
        ),
        Container(
          child: Image.asset('images/foxo.png'),
          width: 64,
        ),
        Score(
          title: 'Wins',
          value: wins,
        ),
      ],
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    );
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
              onWinner: (winner) {
                switch (winner) {
                  case CellType.empty:
                    setState(() {
                      ties++;
                    });
                    break;
                  case CellType.foxo:
                    setState(() {
                      wins++;
                    });
                    break;
                  case CellType.chick:
                }
              }
            ),
            buildResetButton(),
            buildFooter(),
          ],
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        ),
        padding: const EdgeInsets.all(20),
      ),
    );
  }
}
