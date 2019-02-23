import 'package:flutter/material.dart';

ThemeData appTheme = new ThemeData(
  primaryColor: primaryColor,
  hintColor: Colors.black45,
);

TextStyle textStyle = const TextStyle(
  color: Colors.black54,
  fontSize: 16.0,
  fontWeight: FontWeight.w300,
);

TextStyle titleStyle = TextStyle(
  color: Colors.black54,
  fontSize: 16.0,
  fontWeight: FontWeight.w500,
);

TextStyle textMuted({size = 12.0}) => TextStyle(
  color: mutedColor,
  fontSize: size,
  fontWeight: FontWeight.w300,
);

TextStyle bigTitle({size = 30.0}) => TextStyle(
  color: primaryColor,
  fontSize: size,
  fontWeight: FontWeight.w400,
  letterSpacing: 2.0
);

TextStyle title = TextStyle(
  color: mutedColor,
  fontSize: 25.0,
  fontWeight: FontWeight.w300,
);

const double letterSpacingRhode = 3.0;
const double letterSpacingTaller = 8.0;

const Color primaryColor = Color.fromRGBO(29, 33, 107, 1.0);
const Color secondaryColor = Color.fromRGBO(57, 173, 74, 1.0);
const Color thirdColor = const Color.fromRGBO(16, 124, 121, 1.0);
const Color mutedColor = Colors.black38;
const Color textColor = Colors.white;

InputDecoration fieldDecoration({
  hint = "",
  suffixIcon,
}) => InputDecoration(
  hintText: hint,
  suffixIcon: suffixIcon,
  border: InputBorder.none,
  contentPadding: EdgeInsets.all(15.0)
);

InputDecoration fieldDecoration2(hint) => InputDecoration(
  hintText: hint,
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.zero,
    ),
    borderSide: BorderSide(
      color: Colors.black,
      width: 1.0
    )
  ),
  fillColor: Colors.white,
  filled: false,
  contentPadding: EdgeInsets.all(10.0),
  suffixIcon: Icon(
    Icons.more,
    color: Colors.black54,
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.zero,
    ),
    borderSide: BorderSide(
      color: Colors.lightBlue,
    )
  )
);

ShapeDecoration shape = ShapeDecoration(
  color: Color(0x0A000000),
  shape: RoundedRectangleBorder(
    side: BorderSide(
      color: Colors.black26
    ),
    borderRadius: BorderRadius.all(Radius.circular(5.0))
  )
);

ShapeDecoration shapeDropDown = ShapeDecoration(
  color: Colors.black12,
  shape: RoundedRectangleBorder(
    side: BorderSide(
      color: Colors.black12
    ),
    borderRadius: BorderRadius.all(Radius.circular(3.0))
  )
);