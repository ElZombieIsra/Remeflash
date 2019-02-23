import 'package:flutter/material.dart';
import 'package:remeflash/style.dart';
import 'package:remeflash/components/Buttons/MainButtons.dart';
import 'package:remeflash/globals.dart' as globals;

class LoaderScreen extends StatefulWidget {
  _LoaderScreenState createState() => _LoaderScreenState();
}

class _LoaderScreenState extends State<LoaderScreen> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              height: screenSize.height / 3,
              color: Theme.of(context).primaryColor,
            ),
            Expanded(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    
                    SizedBox(height: 80.0,),
                    Text(
                      "Bienvenido a",
                      style: textStyle,
                    ),
                    Text(
                      "${globals.title}",
                      style: bigTitle(size: 35.0),
                    ),
                    SizedBox(height: 10.0,),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Habilitado por ",
                          style: textStyle,
                        ),
                        Image.network(
                          "https://upload.wikimedia.org/wikipedia/commons/4/41/Visa_Logo.png",
                          scale: 10.0,
                        )
                      ],
                    ),
                    SizedBox(height: 25.0,),
                    MainButton(
                      text: "Comenzar",
                      callback: (){
                        Navigator.of(context).pushReplacementNamed("/HomePage");
                      },
                    )
                  ],
                ),
              ),
            )
          ]
        ),
      ),
    );
  }
}