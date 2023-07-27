import 'package:flutter/material.dart';

class SpiralTransition extends StatefulWidget {
  final Widget? child;

  const SpiralTransition({
    super.key,
    this.child,
  });

  @override
  SpiralTransitionState createState() => SpiralTransitionState();
}

class SpiralTransitionState extends State<SpiralTransition>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> turnsAnimation;
  late Animation<double> scaleAnimation;

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
    ).animate(CurvedAnimation(
      parent: controller,
      curve: Curves.linearToEaseOut,
    ));
    scaleAnimation = Tween<double>(
      begin: 0.5,
      end: 1,
    ).animate(CurvedAnimation(
      parent: controller,
      curve: Curves.linearToEaseOut,
    ));
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
      turns: turnsAnimation,
      child: ScaleTransition(
        scale: scaleAnimation,
        child: widget.child,
      ),
    );
  }
}
