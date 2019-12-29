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
  Animation turnsAnimation;
  Animation scaleAnimation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    turnsAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.linearToEaseOut,
      )
    );
    scaleAnimation = Tween<double>(
      begin: 0.5,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.linearToEaseOut,
      )
    );
    if (widget.child != null) {
      controller.forward();
    }
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
        scale: scaleAnimation,
      ),
      turns: turnsAnimation,
    );
  }
}
