import 'package:flutter/material.dart';
import 'package:remeflash/globals.dart' as globals;

class MainDrawer extends StatefulWidget {
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text("${globals.title}"),
          ),
          ListTile(
            title: Text("Some option"),
            onTap: (){
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}