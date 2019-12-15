import 'package:flutter/material.dart';
import 'enums.dart';

class Cell extends StatefulWidget {
  Cell({
    Key key,
    this.type = CellType.empty,
  }) : super(key: key);

  final CellType type;

  @override
  _CellState createState() => _CellState();
}

class _CellState extends State<Cell> {
  Widget buildImage() {
    switch (widget.type) {
      case CellType.empty:
        return null;
      case CellType.foxo:
        return Image.asset('images/foxo.png');
      case CellType.chick:
        return Image.asset('images/chick.png');
    }
  }

  @override Widget build(BuildContext context) {
    return Container(
      child: this.buildImage(),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey[400],
            offset: Offset(5, 5),
            blurRadius: 5,
          )
        ],
        color: Colors.grey[300],
      ),
      padding: const EdgeInsets.all(8.0),
      height: 90.0,
      width: 90.0,
    );
  }
}
