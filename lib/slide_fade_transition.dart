import 'package:flutter/material.dart';

class SlideFadeTransition extends StatefulWidget {
  final Widget child;
  final AnimationController controller;
  final double delay;

  const SlideFadeTransition({
    super.key,
    required this.child,
    required this.controller,
    required this.delay,
  });

  @override
  SlideFadeTransitionState createState() => SlideFadeTransitionState();
}

class SlideFadeTransitionState extends State<SlideFadeTransition>
    with SingleTickerProviderStateMixin {
  Animation<Offset>? slideAnimation;
  Animation<double>? fadeAnimation;

  @override
  void initState() {
    super.initState();
    slideAnimation = Tween(
      begin: const Offset(0, 2),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: widget.controller,
      curve:
          Interval(widget.delay, widget.delay + 0.5, curve: Curves.easeOutBack),
    ));
    fadeAnimation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: widget.controller,
      curve: Interval(widget.delay, widget.delay + 0.5, curve: Curves.easeIn),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: fadeAnimation!,
      child: SlideTransition(
        position: slideAnimation!,
        child: widget.child,
      ),
    );
  }
}
