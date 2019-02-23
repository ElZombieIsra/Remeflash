import 'package:flutter/material.dart';
import 'package:remeflash/style.dart';

class CustomLabel extends StatelessWidget {

  final String text;
  CustomLabel(this.text);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(8.0),
      width: (screenSize.width / 10) * 8,
      child: Text(
        "$text",
        style: textMuted(size: 14.0),
        textAlign: TextAlign.start,
      ),
    );
  }
}