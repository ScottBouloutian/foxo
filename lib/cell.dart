import 'package:flutter/material.dart';
import 'package:foxo_application/spiral_transition.dart';
import 'package:foxo_application/wiggle_transition.dart';
import 'enums.dart';

class Cell extends StatefulWidget {
  final CellType type;
  final bool wiggle;

  const Cell({
    super.key,
    required this.type,
    required this.wiggle,
  });

  @override
  CellState createState() => CellState();
}

class CellState extends State<Cell> {
  Widget? buildImage() {
    switch (widget.type) {
      case CellType.empty:
        return null;
      case CellType.foxo:
        return Container(
          transform: Matrix4.translationValues(8, 0, 0),
          child: Image.asset('images/foxo.png'),
        );
      case CellType.chick:
        return Image.asset('images/chick.png');
    }
  }

  @override
  Widget build(BuildContext context) {
    final image = buildImage();
    final transition = widget.wiggle
        ? WiggleTransition(child: image)
        : SpiralTransition(child: image);
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        color: Colors.grey[200],
      ),
      padding: const EdgeInsets.all(12),
      height: 90,
      width: 90,
      child: transition,
    );
  }
}
