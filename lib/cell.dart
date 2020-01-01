import 'package:flutter/material.dart';
import 'package:foxo/spiral_transition.dart';
import 'package:foxo/wiggle_transition.dart';
import 'enums.dart';

class Cell extends StatefulWidget {
  final CellType type;
  final bool wiggle;

  Cell({
    Key key,
    this.type,
    this.wiggle,
  }) : super(key: key);

  @override
  CellState createState() => CellState();
}

class CellState extends State<Cell> {
  Widget buildImage() {
    switch (widget.type) {
      case CellType.empty:
        return null;
      case CellType.foxo:
        return Container(
          child: Image.asset('assets/images/foxo.png'),
          transform: Matrix4.translationValues(8, 0, 0),
        );
      case CellType.chick:
        return Image.asset('assets/images/chick.png');
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final image = buildImage();
    final transition = widget.wiggle
      ? WiggleTransition(child: image)
      : SpiralTransition(child: image);
    return Container(
      child: transition,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
        color: Colors.grey[200],
      ),
      padding: const EdgeInsets.all(12),
      height: 90,
      width: 90,
    );
  }
}
