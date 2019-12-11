import 'package:flutter/material.dart';
import 'cell.dart';

enum BoardState {
  empty,
  foxo,
  player,
}

class GameBoard extends StatefulWidget {
  GameBoard({
    Key key,
    this.board = const [
      BoardState.empty,
      BoardState.empty,
      BoardState.empty,
      BoardState.empty,
      BoardState.empty,
      BoardState.empty,
      BoardState.empty,
      BoardState.empty,
      BoardState.empty,
    ],
  }) : super(key: key);

  final List<BoardState> board;

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
          children: List.generate(9, (index) {
            return Container(
              child: GestureDetector(
                onTap: () {
                  print('onTap called. $index');
                },
                child: Cell(),
              ),
              padding: const EdgeInsets.all(10),
            );
          }),
        ),
        padding: EdgeInsets.symmetric(vertical: 20),
      ),
    );
  }
}
