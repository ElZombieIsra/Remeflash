import 'package:flutter/material.dart';
import 'package:remeflash/style.dart';
import 'package:remeflash/globals.dart' as globals;
import 'package:remeflash/components/AppBar.dart';
import 'package:remeflash/components/Body.dart';
import 'package:remeflash/components/MainDrawer.dart';
import 'package:remeflash/components/Buttons/MainButtons.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';


class PaymentDataScreen extends StatefulWidget {
  _PaymentDataScreenState createState() => _PaymentDataScreenState();
}

class _PaymentDataScreenState extends State<PaymentDataScreen> {
  final MaskedTextController _controllerCard = MaskedTextController(mask: '0000 0000 0000 0000');
  final MaskedTextController _controllerDate = MaskedTextController(mask: '00/00');
  final MaskedTextController _controllerCode = MaskedTextController(mask: '000');

  @override
  void initState() {
    _controllerCard.updateText(globals.card["number"]);
    _controllerDate.updateText(globals.card["date"]);
    _controllerCode.updateText(globals.card["code"]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mainAppBar(),
      drawer: MainDrawer(),
      body: MainBody(<Widget>[
        Text(
          "Datos de pago",
          style: titleStyle,
        ),
        SizedBox(height: 30.0,),
        CustomInput(
          controller: _controllerCard,
          hint: "Número de tarjeta",
          icon: Icon(Icons.camera_alt),
          keyboardType: TextInputType.number,
        ),
        CustomInput(
          controller: _controllerDate,
          hint: "Fecha de vencimiento",
          keyboardType: TextInputType.number,
        ),
        CustomInput(
          controller: _controllerCode,
          hint: "Código de seguridad",
          keyboardType: TextInputType.number,
        ),
        SizedBox(height: 30.0,),
        MainButton(
          text: "Siguiente",
          callback: (){
            setState(() {
              if (_controllerCard.text.isNotEmpty && _controllerDate.text.isNotEmpty && _controllerCode.text.isNotEmpty) {
                globals.card['number'] = _controllerCard.text;
                globals.card['date'] = _controllerDate.text;
                globals.card['code'] = _controllerCode.text;
                Navigator.pushNamed(context, "/UserConfirmationPage");
              }
            });
          },
        )
      ]),
    );
  }
}

class CustomInput extends StatelessWidget {

  final String hint;
  final Icon icon;
  final TextEditingController controller;
  final TextInputType keyboardType;
  CustomInput({
    @required this.controller,
    this.keyboardType = TextInputType.text,
    this.hint = "",
    this.icon
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
      child: Container(
        decoration: shape,
        child: TextField(
          style: textStyle,
          keyboardType: keyboardType,
          controller: controller,
          decoration: fieldDecoration(
            suffixIcon: icon,
            hint: "$hint",
          ),
        ),
      ),
    );
  }
}