import 'package:flutter/material.dart';
import 'package:remeflash/screens/HomeScreen/HomeScreen.dart';

class MainBody extends StatefulWidget {
  final widgets;
  MainBody(this.widgets);
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
            SizedBox(height: 40.0,),
          ]..addAll(widget.widgets)
        ),
      ),
    );
  }
}