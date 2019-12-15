import 'package:flutter/material.dart';
import 'cell.dart';
import 'enums.dart';

class GameBoard extends StatefulWidget {
  GameBoard({
    Key key,
  }) : super(key: key);

  final List<CellType> board = List.generate(9, (index) => CellType.empty);

  @override
  _GameBoardState createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        child: GridView.count(
          crossAxisCount: 3,
          children: widget.board.asMap().map((index, cellType) {
            return MapEntry(index, Container(
              child: GestureDetector(
                onTap: () {
                  this.setState(() => widget.board[index] = CellType.foxo);
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
