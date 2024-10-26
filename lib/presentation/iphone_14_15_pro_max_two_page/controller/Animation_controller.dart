import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyWidget extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 2), // Adjust the duration as needed
      vsync: this,
    )..repeat();
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
        return Transform.translate(
          offset: Offset(_controller.value * 100.0, 0.0), // Adjust the movement distance as needed
          child: child,
        );
      },
      child: Container(
        height: 20, // Adjust the height as needed
        width: 20, // Adjust the width as needed
        child: Icon(
          FontAwesomeIcons.arrowRight,
          size: 20,
          color: Colors.black,
        ),
      ),
    );
  }
}
