import 'package:flutter/material.dart';
import 'package:remeflash/style.dart';
import 'package:remeflash/globals.dart' as globals;
import 'package:remeflash/components/MainDrawer.dart';
import 'package:remeflash/components/AppBar.dart';
import 'package:remeflash/components/Body.dart';
import 'package:remeflash/components/DropDown.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_messaging/firebase_messaging.dart';


class HomeScreen extends StatefulWidget {
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _currentCountry = globals.country;

  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(), 
      appBar: mainAppBar(),
      body: MainBody([
        CustomDropDown(
          items: globals.countrys,
          value: _currentCountry,
          hint: "Enviar dinero a",
          callback: (_) {
            if(_ == "México"){
              this.setState((){
                _currentCountry = _;
                globals.country = _;
                Navigator.pushNamed(context, "/MoneyPage");
              });
            }
          }
        ),
        SignUp(),
      ], 
      hasBackground: true,
      )
    );
  }

  _init() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool sub = prefs.getBool('subscribed') ?? false;
    if(!sub){
      final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
      _firebaseMessaging.getToken().then((token){
        _subscribe(token);
      });
    }
  }

  _subscribe(token) async {
    final res = await http.get(globals.subscribeUrl + token);
    if (res.statusCode == 200) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool("subscribed", true);
    }
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
              style: bannerStyle,
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