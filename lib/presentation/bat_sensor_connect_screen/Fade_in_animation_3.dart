import 'package:flutter/material.dart';

class FadeInAnimation3 extends StatefulWidget {
  final Widget child;

  const FadeInAnimation3({required this.child});


  @override
  _FadeInAnimation3State createState() => _FadeInAnimation3State();
}

class _FadeInAnimation3State extends State<FadeInAnimation3> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation1;
  late Animation<double> _animation2;
  late Animation<double> _animation3;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 3000), // Adjust the duration as needed
    );

    _animation1 = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.0, 0.3), // Change the interval for the first box
      ),
    );

    _animation2 = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.3, 0.6), // Change the interval for the second box
      ),
    );

    _animation3 = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.6, 1.0), // Change the interval for the third box
      ),
    );

    _controller.forward(); // Start the animation
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Opacity(
          opacity: _animation1.value,
          child: Opacity(
            opacity: _animation2.value,
            child: Opacity(
              opacity: _animation3.value,
              child: widget.child,
            ),
          ),
        );
      },
    );
  }
}
