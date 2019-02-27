import 'package:flutter/material.dart';
import 'package:remeflash/style.dart';
import 'package:remeflash/services/AnimationService.dart';

class CustomDropDown extends StatefulWidget {
  final callback, value;
  final String hint;
  final List items;
  CustomDropDown({
    @required this.callback,
    @required this.value,
    @required this.items,
    this.hint
  });
  _CustomDropDownState createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5.0),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          value: widget.value,
          items: widget.items.map((value) {
            return DropdownMenuItem(
              value: value,
              child: Container(
                padding: EdgeInsets.only(left: 10.0),
                width: 200.0,
                child: value == "México" ? AnimatedText(value) : Text(value),
              ),
            );
          }).toList(),
          hint: Text(widget.hint ?? ""),
          onChanged: widget.callback,
          style: textStyle,
        ),
      ),
      decoration: shape,
    );
  }
}