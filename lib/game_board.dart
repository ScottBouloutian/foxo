import 'package:flutter/material.dart';
import 'cell.dart';
import 'enums.dart';
import 'game.dart';

class GameBoard extends StatefulWidget {
  final Game game;
  final Function onWinner;

  const GameBoard({
    super.key,
    required this.game,
    required this.onWinner,
  });

  @override
  State<GameBoard> createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
  List<int>? winningLine;

  @override
  void didUpdateWidget(GameBoard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.game != widget.game) {
      setState(() {
        winningLine = null;
      });
    }
  }

  void handleCellTap(int index, CellType cellType) {
    var winner = widget.game.findGameState();
    if (cellType == CellType.empty && winner == null) {
      setState(() {
        widget.game.state[index] = CellType.chick;
        winner = widget.game.findGameState();
        if (winner != null) {
          widget.onWinner(winner);
          return;
        }
        final bestMove = widget.game.minimax(0, CellType.foxo);
        widget.game.state[bestMove] = CellType.foxo;
        winner = widget.game.findGameState();
        if (winner != null) {
          setState(() {
            winningLine = widget.game.findWinningLine();
            widget.onWinner(winner);
          });
        }
      });
    }
  }

  List<Widget> buildCells() {
    return widget.game.state
        .asMap()
        .map((index, cellType) {
          final wiggle = winningLine?.contains(index) ?? false;
          return MapEntry(
              index,
              Container(
                padding: const EdgeInsets.all(10),
                child: GestureDetector(
                  onTap: () {
                    handleCellTap(index, cellType);
                  },
                  child: Cell(
                    type: cellType,
                    wiggle: wiggle,
                  ),
                ),
              ));
        })
        .values
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    var cellWidgets = buildCells();
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            cellWidgets[0],
            cellWidgets[1],
            cellWidgets[2],
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            cellWidgets[3],
            cellWidgets[4],
            cellWidgets[5],
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            cellWidgets[6],
            cellWidgets[7],
            cellWidgets[8],
          ],
        ),
      ],
    );
  }
}
