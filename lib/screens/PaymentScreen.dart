import 'package:flutter/material.dart';
import 'package:remeflash/style.dart';
import 'package:remeflash/globals.dart' as globals;
import 'package:remeflash/components/AppBar.dart';
import 'package:remeflash/components/Body.dart';
import 'package:remeflash/components/MainDrawer.dart';
import 'package:remeflash/components/Buttons/MainButtons.dart';

class PaymentScreen extends StatefulWidget {
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  int _currentGroupValue = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mainAppBar(),
      drawer: MainDrawer(),
      body: MainBody(<Widget>[
        Text(
          "¿Cómo efectuará su pago?",
          style: titleStyle,
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          itemCount: globals.paymentTypes.length,
          itemBuilder: (BuildContext contex, int index) => CustomRadio(
            text: "${globals.paymentTypes[index]}",
            value: index + 1,
            groupValue: _currentGroupValue,
            callback: (_){
              setState(() {
                _currentGroupValue = _;
              });
            },
          ),
        ),
        SizedBox(height: 20.0,),
        MainButton(
          text: "Siguiente",
          callback: (){
            setState(() {
              globals.paymentType = _currentGroupValue;
              Navigator.pushNamed(context, "/PaymentDataPage");
            });
          },
        )
      ]),
    );
  }
}

class CustomRadio extends StatefulWidget {
  final int groupValue, value;
  final callback;
  final String text;
  CustomRadio({
    @required this.text,
    @required this.value,
    @required this.groupValue,
    @required this.callback
  });
  _CustomRadioState createState() => _CustomRadioState();
}

class _CustomRadioState extends State<CustomRadio> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Radio(
        activeColor: mutedColor,
        value: widget.value,
        groupValue: widget.groupValue,
        onChanged: widget.callback,
      ),
      title: Padding(
        padding: EdgeInsets.only(left: 15.0),
        child: Text(
          "${widget.text}",
          style: textStyle
        ),
      ),
    );
  }
}