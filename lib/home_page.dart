import 'package:flutter/material.dart';
import 'score.dart';
import 'game_board.dart';
import 'game.dart';
import 'enums.dart';
import 'slide_fade_transition.dart';

class HomePage extends StatefulWidget {
  final String title;

  const HomePage({
    super.key,
    required this.title,
  });

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  bool moveFoxo = true;
  Game game = Game(true);
  int ties = 0;
  int wins = 0;
  AnimationController? controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    controller?.forward();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  Widget buildResetButton() {
    final winner = game.findGameState();
    final duration =
        winner == null ? Duration.zero : const Duration(milliseconds: 500);
    final opacity = winner == null ? 0.0 : 1.0;
    return AnimatedOpacity(
      duration: duration,
      opacity: opacity,
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            moveFoxo = !moveFoxo;
            game = Game(moveFoxo);
          });
        },
        child: Text(
          'Rematch',
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }

  Widget buildFooter() {
    return SlideFadeTransition(
      controller: controller!,
      delay: 0.5,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Score(
            title: 'Wins',
            value: 0,
          ),
          Score(
            title: 'Ties',
            value: ties,
          ),
          Score(
            title: 'Loss',
            value: wins,
          ),
        ],
      ),
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
        title: Text(
          widget.title,
          style: Theme.of(context).primaryTextTheme.titleLarge,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Flexible(
              child: SlideFadeTransition(
                controller: controller!,
                delay: 0.25,
                child: SingleChildScrollView(
                  child: GameBoard(
                    game: game,
                    onWinner: handleWinner,
                  ),
                ),
              ),
            ),
            buildResetButton(),
            buildFooter(),
          ],
        ),
      ),
    );
  }
}
