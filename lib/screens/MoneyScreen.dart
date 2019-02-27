import 'package:flutter/material.dart';
import 'package:remeflash/globals.dart' as globals;
import 'package:remeflash/style.dart';
import 'package:remeflash/components/AppBar.dart';
import 'package:remeflash/components/MainDrawer.dart';
import 'package:remeflash/components/Body.dart';
import 'package:remeflash/components/Label.dart';
import 'package:remeflash/components/Buttons/MainButtons.dart';
import 'package:remeflash/screens/HomeScreen/HomeScreen.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class MoneyScreen extends StatefulWidget {
  _MoneyScreenState createState() => _MoneyScreenState();
}

class _MoneyScreenState extends State<MoneyScreen> {
  String _currentCurrency = globals.currency ?? globals.currencys[0];
  String _currentCurrency2 = globals.currency ?? globals.currencys[1];
  FocusNode _focus =FocusNode();
  final MoneyMaskedTextController _controller1 = MoneyMaskedTextController(
    leftSymbol: "\$",
    decimalSeparator: ".",
    thousandSeparator: ","
  );
  final MoneyMaskedTextController _controller2 = MoneyMaskedTextController(
    leftSymbol: "\$",
    decimalSeparator: ".",
    thousandSeparator: ","
  );
  @override
  Widget build(BuildContext context) {
    if (globals.quantity != null && globals.import != null){
      if (!globals.import){
        _controller1.updateValue(globals.quantity);
      }
      else{
        _controller2.updateValue(globals.quantity);        
      }
    }
    return Scaffold(
      appBar: mainAppBar(),
      drawer: MainDrawer(),
      body: MainBody(<Widget>[
        CustomLabel("Importe a enviar"),
        Container(
          decoration: shape,
          child: Row(
            children: <Widget>[
              Expanded(
                child: TextField(
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w300,
                  ),
                  controller: _controller1,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  decoration: fieldDecoration(),
                  focusNode: _focus,
                  onTap: (){
                    setState(() {
                      _controller1.text = "400000";
                      _controller2.text = "20860"; 
                      _focus.unfocus();
                    });
                  },
                ),
              ),
              Container(
                decoration: shapeDropDown,
                margin: EdgeInsets.zero,
                padding: EdgeInsets.only(left: 5.0, right: 5.0),
                child: DropdownButtonHideUnderline(
                  child: IgnorePointer(
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
              )
            ],
          ),
        ),
        SizedBox(height: 20.0,),
        CustomLabel("Importe a recibir"),
        Container(
          decoration: shape,
          child: Row(
            children: <Widget>[
              Expanded(
                child: TextField(
                  enabled: false,
                  style: textStyle,
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
                  child: IgnorePointer(
                    child: DropdownButton(
                      value: _currentCurrency2,
                      items: globals.currencys.map((currency){
                        return DropdownMenuItem(
                          child: Text(currency, style: textStyle,),
                          value: currency,
                        );
                      }).toList(),
                      onChanged: (_){
                        setState(() {
                          _currentCurrency2 = _;
                        });
                      },
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 40.0,),
        MainButton(
          text: "Siguiente",
          callback: (){
            setState(() {
              if (_controller1.text.isNotEmpty && _controller1.numberValue != 0.0) {
                globals.quantity = _controller1.numberValue;
                globals.import = false;
                globals.currency = _currentCurrency;
                Navigator.pushNamed(context, "/AccountPage");
              }
              else if(_controller2.text.isNotEmpty && _controller2.numberValue != 0.0){
                globals.quantity =_controller2.numberValue;
                globals.import = true;
                globals.currency = _currentCurrency2;
                Navigator.pushNamed(context, "/AccountPage");
              }
            });
          },
        ),
        SignUp(),
      ],),
    );
  }
}