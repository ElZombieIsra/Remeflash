import 'package:flutter/material.dart';
import 'package:remeflash/style.dart';
import 'dart:async';

class AnimatedText extends StatefulWidget {
  final String text;

  AnimatedText(this.text, {
    Key key,
  }) : super(key:key);

  @override
  AnimatedTextState createState() => AnimatedTextState();
}

class AnimatedTextState extends State<AnimatedText> with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<Color> _colorTween;

  @override
  void initState() {
    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 600));
    final CurvedAnimation curve = CurvedAnimation(parent: _animationController, curve: Curves.linear);
    _colorTween = ColorTween(begin: primaryColor, end: Colors.blue).animate(curve);
    _colorTween.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        Timer(Duration(seconds: 2), (){
          _animationController.forward();
        });
      }
      setState(() {});
    });
    _animationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _colorTween,
      builder: (context, child) => Text(
        "${widget.text}",
        style: TextStyle(
          color: _colorTween.value,
        ),
      )
    );
  }

  @override
  dispose() {
    _animationController.dispose();
    super.dispose();
  }
}