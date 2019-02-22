import 'package:flutter/material.dart';
import 'package:remeflash/globals.dart' as globals;
import 'package:remeflash/style.dart';
import 'package:remeflash/components/AppBar.dart';
import 'package:remeflash/components/MainDrawer.dart';
import 'package:remeflash/components/Body.dart';
import 'package:remeflash/components/Buttons/MainButtons.dart';
import 'package:remeflash/screens/HomeScreen/HomeScreen.dart';

class MoneyScreen extends StatefulWidget {
  _MoneyScreenState createState() => _MoneyScreenState();
}

class _MoneyScreenState extends State<MoneyScreen> {
  String _currentCurrency = globals.currencys[0];
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final screenSize =MediaQuery.of(context).size;
    return Scaffold(
      appBar: mainAppBar(),
      drawer: MainDrawer(),
      body: MainBody(<Widget>[
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: 40.0, right: 40.0),
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(8.0),
                  width: (screenSize.width / 10) * 8,
                  child: Text(
                    "Importe a enviar",
                    style: textMuted(size: 14.0),
                    textAlign: TextAlign.start,
                  ),
                ),
                Container(
                  decoration: shape,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: TextField(
                          controller: _controller1,
                          keyboardType: TextInputType.numberWithOptions(decimal: true),
                          decoration: fieldDecoration(),
                        ),
                      ),
                      Container(
                        decoration: shapeDropDown,
                        margin: EdgeInsets.zero,
                        padding: EdgeInsets.only(left: 5.0, right: 5.0),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            value: _currentCurrency,
                            items: globals.currencys.map((currency){
                              return DropdownMenuItem(
                                child: Text(currency, style: textStyle,),
                                value: currency,
                              );
                            }).toList(),
                            onChanged: (_){
                              setState(() {
                                _currentCurrency = _;
                              });
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20.0,),
                Container(
                  padding: EdgeInsets.all(8.0),
                  width: (screenSize.width / 10) * 8,
                  child: Text(
                    "Importe a recibir",
                    style: textMuted(size: 14.0),
                    textAlign: TextAlign.start,
                  ),
                ),
                Container(
                  decoration: shape,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: TextField(
                          controller: _controller2,
                          keyboardType: TextInputType.numberWithOptions(decimal: true),
                          decoration: fieldDecoration(),
                        ),
                      ),
                      Container(
                        decoration: shapeDropDown,
                        margin: EdgeInsets.zero,
                        padding: EdgeInsets.only(left: 5.0, right: 5.0),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            value: _currentCurrency,
                            items: globals.currencys.map((currency){
                              return DropdownMenuItem(
                                child: Text(currency, style: textStyle,),
                                value: currency,
                              );
                            }).toList(),
                            onChanged: (_){
                              setState(() {
                                _currentCurrency = _;
                              });
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 40.0,),
                MainButton(
                  text: "Siguiente",
                  callback: (){},
                ),
                SignUp(),
              ],
            ),
          ),
        )
      ]),
    );
  }
}