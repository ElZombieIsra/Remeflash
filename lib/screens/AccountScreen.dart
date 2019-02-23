import 'package:flutter/material.dart';
import 'package:remeflash/style.dart';
import 'package:remeflash/globals.dart' as globals;
import 'package:remeflash/components/AppBar.dart';
import 'package:remeflash/components/Body.dart';
import 'package:remeflash/components/MainDrawer.dart';
import 'package:remeflash/components/Label.dart';
import 'package:remeflash/components/DropDown.dart';
import 'package:remeflash/components/Buttons/MainButtons.dart';
import 'package:remeflash/screens/HomeScreen/HomeScreen.dart';

class AccountScreen extends StatefulWidget {
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  String _currentAccount = globals.account;
  @override
  Widget build(BuildContext context) {
  final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: mainAppBar(),
      drawer: MainDrawer(),
      body: MainBody(<Widget>[
        CustomLabel("Cuenta depósito"),
        SizedBox(
          width: screenSize.width,
          child: CustomDropDown(
            items: globals.accounts,
            value: _currentAccount,
            callback: (_){
              setState(() {
                globals.account = _;
                _currentAccount = _;
              });
            },
          ),
        ),
        SignUp(),
        MainButton(
          text: "Siguiente",
          callback: (){
            setState(() {
              globals.account = _currentAccount;
              Navigator.pushNamed(context, "/PaymentPage");
            });
          },
        )
      ]),
    );
  }
}
