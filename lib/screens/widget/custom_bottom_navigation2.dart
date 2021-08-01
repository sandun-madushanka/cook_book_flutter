import 'package:cook_book_flutter/utils/constant.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigation extends StatefulWidget {
  final int defaultSelectedIndex;
  final Function(int) onChange;
  final List<IconData> iconlist;

  CustomBottomNavigation({
    this.defaultSelectedIndex = 0,
    required this.onChange,
    required this.iconlist,
  });

  @override
  _CustomBottomNavigationState createState() => _CustomBottomNavigationState();
}

class _CustomBottomNavigationState extends State<CustomBottomNavigation> {
  int _selectedIndex = 0;
  List<IconData> _iconList = [];

  @override
  void initState() {
    super.initState();

    _selectedIndex = widget.defaultSelectedIndex;
    _iconList = widget.iconlist;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _navBarItemList = [];

    for (var i = 0; i < _iconList.length; i++) {
      _navBarItemList.add((buildNavBarItem(_iconList[i], i)));
    }

    return Row(
      children: _navBarItemList,
    );
  }

  Widget buildNavBarItem(IconData icon, int index) {
    return GestureDetector(
      onTap: () {
        widget.onChange(index);
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width / _iconList.length,
        decoration: index == _selectedIndex
            ? BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 4,
                    color: mPrimaryColor,
                  ),
                ),
                gradient: mPBGradientColor,
                // color: index == _selectedItemIndex ? mPrimaryColor : mBackgroundColor,
              )
            : BoxDecoration(),
        child: Icon(
          icon,
          color: index == _selectedIndex ? mPrimaryColor : kTextColorLight,
        ),
      ),
    );
  }
}
