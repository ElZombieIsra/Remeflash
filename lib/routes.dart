import 'package:flutter/material.dart';
import 'package:remeflash/style.dart';
import 'package:remeflash/globals.dart' as globals;

import 'package:remeflash/screens/LoaderScreen.dart';
import 'package:remeflash/screens/HomeScreen/HomeScreen.dart';
import 'package:remeflash/screens/MoneyScreen.dart';

class Routes {
  Map<String, WidgetBuilder> _routes = {
    "/HomePage": (BuildContext context) => HomeScreen(),
    "/MoneyPage": (BuildContext context) => MoneyScreen(),
  };

  Routes(){
    runApp(
      MaterialApp(
        title: "${globals.title}",
        home: LoaderScreen(),
        theme: appTheme,
        routes: _routes,
      )
    );
  }
}
