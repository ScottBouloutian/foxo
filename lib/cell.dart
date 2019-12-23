import 'package:flutter/material.dart';
import 'enums.dart';

class Cell extends StatefulWidget {
  final CellType type;

  Cell({
    Key key,
    this.type,
  }) : super(key: key);

  @override
  CellState createState() => CellState();
}

class CellState extends State<Cell> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;
  Tween<double> turnsTween;
  Tween<double> scaleTween;

  Widget buildImage() {
    switch (widget.type) {
      case CellType.empty:
        return null;
      case CellType.foxo:
        return Image.asset('images/foxo.png');
      case CellType.chick:
        return Image.asset('images/chick.png');
      default:
        return null;
    }
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    animation  = CurvedAnimation(
      parent: controller,
      curve: Curves.easeOutBack,
    );
    turnsTween = Tween<double>(
      begin: 0,
      end: 1,
    );
    scaleTween = Tween<double>(
      begin: 0.5,
      end: 1,
    );
  }

  @override
  didUpdateWidget(oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.type == CellType.empty && widget.type != CellType.empty) {
      controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RotationTransition(
        child: ScaleTransition(
          child: this.buildImage(),
          scale: scaleTween.animate(animation),
        ),
        turns: turnsTween.animate(animation),
      ),
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
