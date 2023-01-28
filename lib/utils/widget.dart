//Dart variable file for all the widgets used
import 'dart:async';

import 'package:board_exam_analysis/utils/fonts.dart';
import 'package:flutter/material.dart';

class GradientText extends StatelessWidget {
  const GradientText(
    this.text, {super.key, 
    required this.gradient,
    this.style,
  });

  final String ?text;
  final TextStyle? style;
  final Gradient? gradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient!.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(text!, style: style),
    );
  }
}

class GlowingText extends StatefulWidget {
  final String text;
  final double fontSize;
  final Color color;
  final Duration duration;

  GlowingText({
    required this.text,
    this.fontSize = 20,
    this.color = const Color(0xff00425A),
    this.duration = const Duration(milliseconds: 500),
  });

  @override
  _GlowingTextState createState() => _GlowingTextState();
}

class _GlowingTextState extends State<GlowingText> {
  bool _isGlowing = false;

  @override
  void initState() {
    super.initState();
    timer();
  }

  timer() {
    return Future.delayed(
      Duration(seconds: 2),
      () {
        Timer.periodic(Duration(seconds: 1), (timer) {
          setState(() {
            _isGlowing = !_isGlowing;
          });
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedDefaultTextStyle(
      duration: widget.duration,
      style: _isGlowing
          ? TextStyle(
              color: widget.color,
              fontSize: widget.fontSize,
              fontFamily: monb,
              fontWeight: FontWeight.bold)
          : TextStyle(
              color: Colors.white,
              fontSize: widget.fontSize,
              fontFamily: monb,
              fontWeight: FontWeight.bold),
      child: Text(widget.text),
      
    );
  }
}
