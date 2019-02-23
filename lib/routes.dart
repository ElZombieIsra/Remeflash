import 'package:flutter/material.dart';
import 'package:remeflash/style.dart';
import 'package:remeflash/globals.dart' as globals;

import 'package:remeflash/screens/LoaderScreen.dart';
import 'package:remeflash/screens/HomeScreen/HomeScreen.dart';
import 'package:remeflash/screens/MoneyScreen.dart';
import 'package:remeflash/screens/AccountScreen.dart';
import 'package:remeflash/screens/PaymentScreen.dart';
import 'package:remeflash/screens/PaymentDataScreen.dart';
import 'package:remeflash/screens/UserConfirmationScreen.dart';
import 'package:remeflash/screens/ConfirmationScreen.dart';

class Routes {
  Map<String, WidgetBuilder> _routes = {    
    "/LoadPage": (BuildContext context) => LoaderScreen(),
    "/HomePage": (BuildContext context) => HomeScreen(),
    "/MoneyPage": (BuildContext context) => MoneyScreen(),
    "/AccountPage": (BuildContext context) => AccountScreen(),
    "/PaymentPage": (BuildContext context) => PaymentScreen(),
    "/PaymentDataPage": (BuildContext context) => PaymentDataScreen(),
    "/UserConfirmationPage": (BuildContext context) => UserConfirmationScreen(),
    "/ConfirmationPage": (BuildContext context) => ConfirmationScreen(),
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
