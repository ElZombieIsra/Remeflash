import 'package:flutter/material.dart';
import 'package:remeflash/style.dart';
import 'package:remeflash/globals.dart' as globals;

mainAppBar(){
  return AppBar(
      title: Padding(
        padding: EdgeInsets.only(left: 40.0),
        child: Text(
          globals.title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            letterSpacing: 3.0
          ),
        ),
      ),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(5.0),
        child: SizedBox(
          height: 20.0,
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text(
                  "Habilitado por ",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10.0,
                    fontWeight: FontWeight.w300
                  ),
                ),
                Image.network(
                  "https://upload.wikimedia.org/wikipedia/commons/4/41/Visa_Logo.png",
                  scale: 18.0,
                )
              ],
            ),
          ),
        )
      ),
    );
}