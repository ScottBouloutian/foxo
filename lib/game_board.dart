import 'package:flutter/material.dart';
import 'cell.dart';
import 'enums.dart';
import 'game.dart';
import 'dart:math';

class GameBoard extends StatefulWidget {
  GameBoard({
    Key key,
  }) : super(key: key);

  @override
  _GameBoardState createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
  Game game;

  @override
  void initState() {
    super.initState();
    game = Game();
    final moves = [0, 2, 6, 8];
    final random = Random();
    final index = random.nextInt(moves.length);
    game.state[moves[index]] = CellType.foxo;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        child: GridView.count(
          crossAxisCount: 3,
          children: game.state.asMap().map((index, cellType) {
            return MapEntry(index, Container(
              child: GestureDetector(
                onTap: () {
                  if (cellType == CellType.empty) {
                    this.setState(() {
                      game.state[index] = CellType.chick;
                      final bestMove = game.minimax(0, CellType.foxo);
                      game.state[bestMove] = CellType.foxo;
                    });
                  }
                },
                child: Cell(type: cellType),
              ),
              padding: const EdgeInsets.all(10),
            ));
          }).values.toList(),
        ),
        padding: EdgeInsets.symmetric(vertical: 20),
      ),
    );
  }
}
