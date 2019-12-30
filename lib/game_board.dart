import 'package:flutter/material.dart';
import 'cell.dart';
import 'enums.dart';
import 'game.dart';

class GameBoard extends StatefulWidget {
  final Game game;
  final Function onWinner;

  GameBoard({
    Key key,
    this.game,
    this.onWinner,
  }) : super(key: key);

  @override
  _GameBoardState createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
  List<int> winningLine;

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
      this.setState(() {
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
    return widget.game.state.asMap().map((index, cellType) {
      final wiggle = winningLine != null && winningLine.contains(index);
      return MapEntry(index, Container(
        child: GestureDetector(
          onTap: () {
            handleCellTap(index, cellType);
          },
          child: Cell(
            type: cellType,
            wiggle: wiggle,
          ),
        ),
        padding: const EdgeInsets.all(10),
      ));
    }).values.toList();
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: GridView.count(
        crossAxisCount: 3,
        children: buildCells(),
        shrinkWrap: true,
      ),
    );
  }
}
