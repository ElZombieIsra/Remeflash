import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {

  final callback;
  final String text;
  final Color color;

  MainButton({
    Key key,
    @required this.callback,
    @required this.text,
    this.color
  }) : super(key:key);

  
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0)
      ),
      textColor: Colors.white,
      color: color ?? Theme.of(context).primaryColor,
      child: Container(
        width: 180.0,
        child: Center(
          child: Text("$text"),
        ),
      ),
      onPressed: callback,
    );
  }
}