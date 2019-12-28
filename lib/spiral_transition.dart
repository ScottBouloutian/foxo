import 'package:flutter/material.dart';

class SpiralTransition extends StatefulWidget {
  final Widget child;

  SpiralTransition({
    Key key,
    this.child,
  }) : super(key: key);

  @override
  SpiralTransitionState createState() => SpiralTransitionState();
}

class SpiralTransitionState extends State<SpiralTransition> with SingleTickerProviderStateMixin {
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
    animation = CurvedAnimation(
      parent: controller,
      curve: Curves.linearToEaseOut,
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
  void didUpdateWidget(SpiralTransition oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.child == null && widget.child != null) {
      controller.reset();
      controller.forward();
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      child: ScaleTransition(
        child: widget.child,
        scale: scaleTween.animate(animation),
      ),
      turns: turnsTween.animate(animation),
    );
  }
}
