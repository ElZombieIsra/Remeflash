import 'package:flutter/material.dart';
import 'package:remeflash/style.dart';
import 'dart:async';

class MainButton extends StatefulWidget {

  final callback;
  final String text;
  final Color color;

  MainButton({
    Key key,
    @required this.callback,
    @required this.text,
    this.color = primaryColor
  }) : super(key:key);

  @override
  MainButtonState createState() => MainButtonState();
}

class MainButtonState extends State<MainButton> with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<Color> _colorTween;

  @override
  void initState() {
    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 600));
    final CurvedAnimation curve = CurvedAnimation(parent: _animationController, curve: Curves.linear);
    _colorTween = ColorTween(begin: widget.color, end: Colors.blue).animate(curve);
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
      builder: (context, child) => RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        textColor: Colors.white,
        color: _colorTween.value,
        child: Container(
          width: 180.0,
          child: Center(
            child: Text("${widget.text}"),
          ),
        ),
        onPressed: widget.callback,
      )
    );
  }

  @override
  dispose() {
    _animationController.dispose();
    super.dispose();
  }
}