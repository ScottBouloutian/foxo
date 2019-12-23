import 'package:flutter/material.dart';
import 'cell.dart';
import 'enums.dart';
import 'dart:math';

class GameBoard extends StatefulWidget {
  GameBoard({
    Key key,
  }) : super(key: key);

  @override
  _GameBoardState createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
  List<CellType> board = List.generate(9, (index) => CellType.empty);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        child: GridView.count(
          crossAxisCount: 3,
          children: board.asMap().map((index, cellType) {
            return MapEntry(index, Container(
              child: GestureDetector(
                onTap: () {
                  final Random random = Random();
                  final CellType type = [CellType.foxo, CellType.chick][random.nextInt(2)];
                  this.setState(() {
                    board[index] = type;
                  });
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
