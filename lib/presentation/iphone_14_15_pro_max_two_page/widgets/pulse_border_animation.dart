import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class PulseColorAnimation extends StatefulWidget {
  final Widget child;

  PulseColorAnimation({required this.child});

  @override
  _PulseColorAnimationState createState() => _PulseColorAnimationState();
}

class _PulseColorAnimationState extends State<PulseColorAnimation> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _radiusAnimation;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    )..repeat();

    _radiusAnimation = Tween<double>(begin: 0.0, end: 1.2).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOutBack,

    ));

    _colorAnimation = ColorTween(begin: Colors.red.shade500, end: Colors.blue.shade900).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          painter: PulsePainter(
            radius: _radiusAnimation.value,
            color: _colorAnimation.value!,
          ),
          child: widget.child,
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class PulsePainter extends CustomPainter {
  final double radius;
  final Color color;

  PulsePainter({required this.radius, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..strokeWidth = 2.0;

    final center = Offset(size.width / 2, size.height / 2);
    final maxRadius = min(size.width, size.height) / 2;

    final currentRadius = radius * maxRadius;

    canvas.drawCircle(center, currentRadius, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
