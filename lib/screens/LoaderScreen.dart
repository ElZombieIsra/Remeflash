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
            Stack(
              children: <Widget>[
                ClipPath(
                  child: Container(
                    height: (screenSize.height / 4) * 2,
                    color: Theme.of(context).primaryColor,
                  ),
                  clipper: _WaveClipper(),
                ),
                Container(
                  height: (screenSize.height / 4) * 2,
                  padding: EdgeInsets.fromLTRB(40.0, 0.0, 40.0, 0.0),
                  child: Column(
                    children: <Widget>[
                      Expanded(child: Container(),),
                      Image.asset("assets/images/6.png")
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    SizedBox(height: 40.0,),
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

class _WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size){
    var path = Path();
    path.lineTo(0.0, size.height - 50);

    var firstControlPoint = Offset(size.width / 12, size.height);
    var firstEndPoint = Offset(size.width / 3, size.height - 25.0);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    path.lineTo(size.width - 80.0, size.height - 70);

    var secondControlPoint =
        Offset(size.width - 10.0, size.height - 90);
    var secondEndPoint = Offset(size.width, size.height - 70);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, size.height - 40);
    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}