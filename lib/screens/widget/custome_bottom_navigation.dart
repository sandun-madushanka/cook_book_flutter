import 'package:cook_book_flutter/utils/constant.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigation extends StatefulWidget {
  final int defaultSelectedIndex;
  final Function(int) onChange;
  final List<IconData> iconlist;
  final List<IconData> iconListSelected;
  final List<String> name;

  CustomBottomNavigation({
    this.defaultSelectedIndex = 0,
    required this.onChange,
    required this.iconlist,
    required this.iconListSelected,
    required this.name,
  });

  @override
  _CustomBottomNavigationState createState() => _CustomBottomNavigationState();
}

class _CustomBottomNavigationState extends State<CustomBottomNavigation> {
  int _selectedIndex = 0;
  List<IconData> _iconList = [];
  List<IconData> _iconListSelected = [];
  List<String> _nameList = [];

  @override
  void initState() {
    super.initState();

    _selectedIndex = widget.defaultSelectedIndex;
    _iconList = widget.iconlist;
    _iconListSelected = widget.iconListSelected;
    _nameList = widget.name;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _navBarItemList = [];

    for (var i = 0; i < _iconList.length; i++) {
      _navBarItemList.add((buildNavBarItem(
          _iconList[i], _iconListSelected[i], i, _nameList[i])));
    }

    return Row(
      children: _navBarItemList,
    );
  }

  Widget buildNavBarItem(
      IconData icon, IconData iconSelected, int index, String name) {
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
        child: Column(
          children: [
            SizedBox(
              height: 6,
            ),
            Icon(
              index == _selectedIndex ? iconSelected : icon,
              color: kTextColorLight,
              size: 24,
            ),
            SizedBox(
              height: 6,
            ),
            Text(
              '$name',
              style: TextStyle(
                color:
                    index == _selectedIndex ? mPrimaryColor : kTextColorLight,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
