import 'package:cook_book_flutter/screens/Screen1/Screen1.dart';
import 'package:cook_book_flutter/screens/Screen2/Screen2.dart';
import 'package:cook_book_flutter/screens/Screen3/Screen3.dart';
import 'package:cook_book_flutter/screens/Screen5/Screen5.dart';
import 'package:flutter/material.dart';

import 'custom_bottom_navigation2.dart';

class MainHomeScreen2 extends StatefulWidget {
  @override
  _MainHomeScreen2State createState() => _MainHomeScreen2State();
}

class _MainHomeScreen2State extends State<MainHomeScreen2> {
  int _selectedItem = 0;
  List<Widget> _widgetOptions = <Widget>[
    Screen1(),
    Screen2(),
    Screen5(),
  ];

  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text('Are you sure?'),
            content: new Text('Do you want to exit an App'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: new Text('No'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: new Text('Yes'),
              ),
            ],
          ),
        )) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        bottomNavigationBar: CustomBottomNavigation(
          iconlist: [
            Icons.home,
            Icons.ac_unit,
            Icons.person,
          ],
          onChange: (val) {
            setState(() {
              _selectedItem = val;
            });
          },
          defaultSelectedIndex: 0,
        ),
        body: Center(
          child: _widgetOptions[_selectedItem],
        ),
      ),
    );
  }
}
