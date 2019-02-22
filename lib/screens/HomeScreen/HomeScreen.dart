import 'package:flutter/material.dart';
import 'package:remeflash/style.dart';
import 'package:remeflash/globals.dart' as globals;
import 'package:remeflash/components/MainDrawer.dart';
import 'package:remeflash/components/AppBar.dart';
import 'package:remeflash/components/Body.dart';

class HomeScreen extends StatefulWidget {
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _currentCountry;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: mainAppBar(),
      body: MainBody([
        Container(
          padding: EdgeInsets.all(5.0),
          child: DropdownButtonHideUnderline(
            child: DropdownButton(
              value: _currentCountry,
              items: globals.countrys.map((value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Container(
                    padding: EdgeInsets.only(left: 10.0),
                    width: 200.0,
                    child: Text(value),
                  ),
                );
              }).toList(),
              hint: Text("Enviar dinero a"),
              onChanged: (_) {
                this.setState((){
                  _currentCountry = _;
                  globals.country = _;
                  Navigator.pushNamed(context, "/MoneyPage");
                });
              },
              style: textStyle,
            ),
          ),
          decoration: shape,
        ),
        SignUp(),
        Expanded(
          child: Container(color: Colors.orange,),
      )
      ])
    );
  }
}

class MainBanner extends StatelessWidget {
  final Size screenSize;
  MainBanner(this.screenSize);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SizedBox(
        width: screenSize.width,
        height: 100.0,
        child: Center(
          child: SizedBox(
            width: screenSize.width / 2,
            child: Text(
              "Envía dinero internacionalmente",
              style: textStyle,
              textAlign: TextAlign.center,
            ),
          )
        ),
      ),
      elevation: 2.0,
    );
  }
}

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 0.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "¿No tienes cuenta?",
            style: TextStyle(
              color:mutedColor,
              fontSize: 10.0,
            ),
          ),
          FlatButton(
            child: Text(
              "Regístrate ahora",
              style:TextStyle(
                color: Colors.blueGrey,
                fontSize: 10.0
              )
            ),
            onPressed: (){},
          )
        ],
      ),
    );
  }
}