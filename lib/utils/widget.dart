//Dart variable file for all the widgets used
import 'dart:async';

import 'package:board_exam_analysis/utils/fonts.dart';
import 'package:flutter/material.dart';

class GradientText extends StatelessWidget {
  const GradientText(
    this.text, {
    super.key,
    required this.gradient,
    this.style,
  });

  final String? text;
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

class TextInputs extends StatelessWidget {
  const TextInputs({
    super.key,
    required this.controller,
    this.hintText,
    this.contentPadding,
    this.edgeRadius,
    this.keyboardType,
    required this.validator,
    this.hideText,
    this.inputTextSize,
    this.fontWeight,
    this.textColor,
    this.hintStyle,
    this.prefIcon,
    this.sufficon,
    this.label,
    this.labelColor,
    required this.Onchanged,
    this.readOnly,
    this.Fields_Width,
    this.Fields_Height,
  });
  final controller;
  final hintText;
  final edgeRadius;
  final keyboardType;
  final hintStyle;
  final prefIcon;
  final sufficon;
  final Function validator;
  final Function Onchanged;
  final hideText;
  final label;
  final inputTextSize;
  final fontWeight;
  final textColor;
  final labelColor;
  final contentPadding;
  final readOnly;
  final Fields_Width;
  final Fields_Height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Fields_Width,
      height: Fields_Height,
      child: TextFormField(
        readOnly: readOnly,
        controller: controller,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(contentPadding),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black, width: 1.0),
              borderRadius: BorderRadius.circular(edgeRadius),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black, width: 1.0),
              borderRadius: BorderRadius.circular(edgeRadius),
            ),
            label: label,
            labelStyle: TextStyle(color: labelColor),
            hintStyle: hintStyle,
            prefixIcon: prefIcon,
            suffixIcon: sufficon,
            hintText: hintText,
            prefixStyle: const TextStyle(color: Colors.grey),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            )),
        keyboardType: keyboardType,
        validator: validator(),
        onChanged: Onchanged(),
        obscureText: hideText,
        style: TextStyle(
          fontSize: inputTextSize,
          fontWeight: fontWeight,
          color: textColor,
        ),
      ),
    );
  }
}
