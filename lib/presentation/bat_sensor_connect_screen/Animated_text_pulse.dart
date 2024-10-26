import 'package:flutter/material.dart';

class AnimatedTextWithArrow extends StatefulWidget {
  final String text;
  final double fontSize;
  final Color color;
  final VoidCallback onTap;

  const AnimatedTextWithArrow({
    Key? key,
    required this.text,
    this.fontSize = 16,
    this.color = Colors.deepOrange,
    required this.onTap,
  }) : super(key: key);

  @override
  _AnimatedTextWithArrowState createState() => _AnimatedTextWithArrowState();
}

class _AnimatedTextWithArrowState extends State<AnimatedTextWithArrow> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    )..repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 120),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Transform.translate(
                  offset: Offset(4 * _controller.value, 0), // Adjust vertical movement range
                  child: Icon(
                    Icons.arrow_forward_ios, // Use arrow icon
                    size: widget.fontSize * 1.08, // Adjust the size of the icon
                    color: widget.color,
                  ),
                ),
                SizedBox(width: 8), // Add some spacing between icon and text
                Text(
                  widget.text,
                  style: TextStyle(
                    fontSize: widget.fontSize,
                    fontWeight: FontWeight.bold,
                    color: widget.color,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}



// class AnimatedTextPulse extends StatefulWidget {
//   final String text;
//   final double fontSize;
//   final Color color;
//   final VoidCallback onTap;
//
//   const AnimatedTextPulse({
//     Key? key,
//     required this.text,
//     this.fontSize = 20,
//     this.color = Colors.deepOrange,
//     required this.onTap,
//   }) : super(key: key);
//
//   @override
//   _AnimatedTextPulseState createState() => _AnimatedTextPulseState();
// }
//
// class _AnimatedTextPulseState extends State<AnimatedTextPulse> with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       vsync: this,
//       duration: Duration(milliseconds: 1000),
//     )..repeat(reverse: true);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.only(bottom: 120), // Adjust the top padding as needed
//       child: GestureDetector(
//         onTap: widget.onTap,
//         child: AnimatedBuilder(
//           animation: _controller,
//           builder: (context, child) {
//             return Text(
//               widget.text,
//               style: TextStyle(
//                 fontSize: widget.fontSize + (_controller.value * 3), // Adjust pulsing effect
//                 fontWeight: FontWeight.bold,
//                 color: Color.lerp(Colors.deepOrange, Colors.orange, _controller.value), // Adjust color animation
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
// }
