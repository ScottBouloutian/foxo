import 'package:flutter/material.dart';
import 'cell.dart';
import 'enums.dart';
import 'game.dart';
import 'dart:math';

class GameBoard extends StatefulWidget {
  final Game game;

  GameBoard({
    Key key,
    this.game,
  }) : super(key: key);

  @override
  _GameBoardState createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
  @override
  void initState() {
    super.initState();
    final moves = [0, 2, 6, 8];
    final random = Random();
    final index = random.nextInt(moves.length);
    widget.game.state[moves[index]] = CellType.foxo;
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      children: widget.game.state.asMap().map((index, cellType) {
        return MapEntry(index, Container(
          child: GestureDetector(
            onTap: () {
              final winner = widget.game.findGameState();
              if (cellType == CellType.empty && winner == null) {
                this.setState(() {
                  widget.game.state[index] = CellType.chick;
                  final bestMove = widget.game.minimax(0, CellType.foxo);
                  widget.game.state[bestMove] = CellType.foxo;
                });
              }
            },
            child: Cell(type: cellType),
          ),
          padding: const EdgeInsets.all(10),
        ));
      }).values.toList(),
      shrinkWrap: true,
    );
  }
}
