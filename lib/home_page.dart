import 'package:flutter/material.dart';
import 'message.dart';
import 'score.dart';
import 'game_board.dart';
import 'game.dart';
import 'enums.dart';
import 'slide_fade_transition.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{
  bool moveFoxo;
  Game game;
  int ties;
  int wins;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    moveFoxo = true;
    game = Game(moveFoxo);
    ties = 0;
    wins = 0;
    controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Widget buildResetButton() {
    final winner = game.findGameState();
    final duration = winner == null
      ? Duration.zero
      : const Duration(milliseconds: 500);
    final opacity = winner == null ? 0.0 : 1.0;
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
      duration: duration,
      opacity: opacity,
    );
  }

  Widget buildFooter() {
    return SlideFadeTransition(
      child: Row(
        children: [
          Score(
            title: 'Ties',
            value: ties,
          ),
          Container(
            child: Opacity(
              child: Image.asset('images/foxo.png'),
              opacity: 0.5,
            ),
            width: 64,
          ),
          Score(
            title: 'Wins',
            value: wins,
          ),
        ],
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      ),
      controller: controller,
      delay: 0.5,
    );
  }

  void handleWinner(CellType winner) {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        child: Column(
          children: [
            SlideFadeTransition(
              child: Message(),
              controller: controller,
              delay: 0,
            ),
            Flexible(
              child: SlideFadeTransition(
                child: GameBoard(
                  game: game,
                  onWinner: handleWinner,
                ),
                controller: controller,
                delay: 0.25,
              ),
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
