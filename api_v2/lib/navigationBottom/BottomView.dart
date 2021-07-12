import 'package:api_v2/navigationBottom/Setting.dart';
import 'package:flutter/material.dart';

import 'Main.dart';

class BottomView extends StatefulWidget {
  const BottomView({Key key}) : super(key: key);

  @override
  _BottomViewState createState() => _BottomViewState();
}

class _BottomViewState extends State<BottomView> {
  int currentIndex=0;

  var widgets=[
    Main( ),
    Icon(Icons.favorite),
    Setting()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widgets[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex:currentIndex ,
        onTap: (value) {
          setState(() {
            currentIndex=value;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite),label: "Fav"),
          BottomNavigationBarItem(icon: Icon(Icons.settings),label: "Setting"),

        ],
      ),
    );
  }
}
