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
    if (widget.type != CellType.empty) {
      controller.forward();
    }
  }

  Widget buildImage() {
    switch (widget.type) {
      case CellType.empty:
        return null;
      case CellType.foxo:
        return Container(
          child: Image.asset('images/foxo.png'),
          transform: Matrix4.translationValues(8, 0, 0),
        );
      case CellType.chick:
        return Image.asset('images/chick.png');
      default:
        return null;
    }
  }

  @override
  void didUpdateWidget(oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.type == CellType.empty && widget.type != CellType.empty) {
      controller.forward();
    } else if (oldWidget.type != CellType.empty && widget.type == CellType.empty) {
      controller.reset();
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
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
        color: Colors.grey[200],
      ),
      padding: const EdgeInsets.all(12),
      height: 90,
      width: 90,
    );
  }
}
