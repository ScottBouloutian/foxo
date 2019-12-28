import 'package:flutter/material.dart';

class WiggleTransition extends StatefulWidget {
  final Widget child;

  WiggleTransition({
    Key key,
    this.child,
  }) : super(key: key);

  @override
  WiggleTransitionState createState() => WiggleTransitionState();
}

class WiggleTransitionState extends State<WiggleTransition> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    animation = TweenSequence([
      TweenSequenceItem(
        tween: Tween<double>(
          begin: 0,
          end: 1 / 16,
        ),
        weight: 25,
      ),
      TweenSequenceItem(
        tween: Tween<double>(
          begin: 1 / 16,
          end: -1 / 16,
        ),
        weight: 50,
      ),
      TweenSequenceItem(
        tween: Tween<double>(
          begin: -1 / 16,
          end: 0,
        ),
        weight: 25,
      ),
    ]).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.linear,
      ),
    );
    animation.addStatusListener((status) {
      switch (status) {
        case AnimationStatus.completed:
          controller.reverse();
          break;
        case AnimationStatus.dismissed:
          controller.forward();
          break;
        case AnimationStatus.forward:
        case AnimationStatus.reverse:
      }
    });
    controller.forward();
 }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      child: widget.child,
      turns: animation,
    );
  }
}
