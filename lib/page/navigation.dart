import 'package:bacameterpdam/page/catatmeter.dart';
import 'package:bacameterpdam/page/historycatat.dart';
import 'package:bacameterpdam/page/home.dart';
import 'package:flutter/material.dart';

class  PageNavigation extends StatefulWidget {
  @override
  _PageNavigationState createState() => _PageNavigationState();
}

class _PageNavigationState extends State<PageNavigation> {
  int _selectedItemIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedItemIndex,
        children: <Widget>[
          PageHome(),
          PageCatatMeter(),
          PageHistoryCatat(),
        ],
      ),
      bottomNavigationBar: Row(
        children: <Widget>[
          buildNavBarItem(Icons.home, 0),
          buildNavBarItem(Icons.photo_camera, 1),
          buildNavBarItem(Icons.history, 2),
        ],
      ),
    );
  }

  Widget buildNavBarItem(IconData icon, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedItemIndex = index;
        });
      },
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width / 3,
        decoration: index == _selectedItemIndex
            ? BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 4, color: Colors.blueAccent),
                ),
              )
            : BoxDecoration(),
        child: Icon(
          icon,
          color: index == _selectedItemIndex ? Colors.blueAccent : Colors.grey,
          size: 30,
        ),
      ),
    );
  }
}
