import 'package:flutter/material.dart';
import 'package:remeflash/style.dart';
import 'package:remeflash/globals.dart' as globals;
import 'package:remeflash/components/AppBar.dart';
import 'package:remeflash/components/Body.dart';
import 'package:remeflash/components/MainDrawer.dart';
import 'package:remeflash/components/Buttons/MainButtons.dart';


class UserConfirmationScreen extends StatefulWidget {
  _UserConfirmationScreenState createState() => _UserConfirmationScreenState();
}

class _UserConfirmationScreenState extends State<UserConfirmationScreen> {
  @override
  Widget build(BuildContext context) {
    final String number = globals.card['number'].toString();
    return Scaffold(
      appBar: mainAppBar(),
      drawer: MainDrawer(),
      body: MainBody(<Widget>[
        Text(
          "Confirmación",
          style: titleStyle
        ),
        RotationTransition(
          turns: AlwaysStoppedAnimation(-30 / 360),
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Icon(
              Icons.send,
              color: Color.fromRGBO(255, 207, 73, 1.0),
              size: 100.0,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "${globals.import ? 'Recibo' : 'Envío'} de ",
              style: textStyle,
            ),
            Text(
              "\$${globals.numberFormat(globals.quantity)} ${globals.currency}",
              style: titleStyle
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "desde la cuenta ",
              style: textStyle,
            ),
            Text(
              "${globals.import ? globals.account : "Visa " + number.substring(number.length-4)}",
              style: titleStyle
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "a la cuenta ",
              style: textStyle,
            ),
            Text(
              "${!globals.import ? globals.account : "Visa " + number.substring(number.length-4)}",
              style: titleStyle
            )
          ],
        ),
        SizedBox(height: 40.0,),
        MainButton(
          text: "Finalizar",
          color: Color.fromRGBO(231, 129, 47, 1.0),
          callback: (){
            Navigator.pushNamed(context, "/ConfirmationPage"); // TODO: Change to Replacement
          },
        )
      ]),
    );
  }
}