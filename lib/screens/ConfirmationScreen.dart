import 'package:flutter/material.dart';
import 'package:remeflash/globals.dart' as globals;
import 'package:remeflash/style.dart';
import 'package:remeflash/components/AppBar.dart';
import 'package:remeflash/components/Body.dart';
import 'package:remeflash/components/MainDrawer.dart';
import 'package:remeflash/components/Buttons/MainButtons.dart';
import 'package:http/http.dart' as http;

class ConfirmationScreen extends StatefulWidget {
  _ConfirmationScreenState createState() => _ConfirmationScreenState();
}

class _ConfirmationScreenState extends State<ConfirmationScreen> {

  @override
  void initState() {
    super.initState();
    _sendNotification();
  }

  _sendNotification() async {
    await http.get(
      globals.notificationUrl 
      + "\$" + globals.numberFormat(globals.quantity)
      + " " + globals.currency
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mainAppBar(),
      drawer: MainDrawer(),
      body: MainBody(<Widget>[
        Icon(
          Icons.done,
          color: Theme.of(context).primaryColor,
          size: 100.0,
        ),
        Text(
          "¡Felicidades!",
          style: titleStyle,
        ),
        Text(
          "Su transacción se",
          style: textStyle,
        ),
        Text(
          "realizó con éxito.",
          style: textStyle,
        ),
        Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(
            "No. de referencia 6458521SDF",
            style: textMuted(size: 11.0),
          ),
        ),
        SizedBox(height: 40.0,),
        MainButton(
          text: "Ir a inicio",
          callback: (){
            globals.clearData();
            Navigator.pushNamedAndRemoveUntil(
              context, 
              "/LoadPage", 
              (Route<dynamic> route) => false
            );
          },
        ),
        FlatButton(
          child: Text(
            "Hacer otra transacción",
            style: TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.w300,
            ),
          ),
          onPressed: (){
            globals.clearData();
            Navigator.pushNamedAndRemoveUntil(
              context, 
              "/HomePage", 
              (Route<dynamic> route) => false
            );
          },
        )
      ]),
    );
  }
}