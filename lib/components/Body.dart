import 'package:flutter/material.dart';
import 'package:remeflash/screens/HomeScreen/HomeScreen.dart';

class MainBody extends StatefulWidget {
  final widgets;
  final bool hasBackground;
  MainBody(this.widgets, {
    this.hasBackground = false,
  });
  _MainBodyState createState() => _MainBodyState();
}

class _MainBodyState extends State<MainBody> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            MainBanner(screenSize,),
            Expanded(
              child: ListView(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(40.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: widget.widgets,
                    ),
                  )
                ],
              )
            ),
            widget.hasBackground ? Image.asset("assets/images/background.png") : Container(),
          ],
        ),
      ),
    );
  }
}