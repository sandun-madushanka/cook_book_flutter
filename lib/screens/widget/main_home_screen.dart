import 'package:cook_book_flutter/screens/Screen1/Screen1.dart';
import 'package:cook_book_flutter/screens/Screen2/Screen2.dart';
import 'package:cook_book_flutter/screens/Screen3/Screen3.dart';
import 'package:cook_book_flutter/screens/Screen4/Screen4.dart';
import 'package:cook_book_flutter/screens/widget/custome_bottom_navigation.dart';
import 'package:flutter/material.dart';

class MainHomeScreen extends StatefulWidget {
  const MainHomeScreen({Key? key}) : super(key: key);

  @override
  _MainHomeScreenState createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  int _selectedIndex = 0;

  List<GlobalKey<NavigatorState>> _navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>()
  ];

  Future<bool> _onWillPop() async {
    final isFirstRouteInCurrentTab =
        !await _navigatorKeys[_selectedIndex].currentState!.maybePop();

    // let system handle back button if we're on the first route
    if (isFirstRouteInCurrentTab) {
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
    // let system handle back button if we're on the first route
    return isFirstRouteInCurrentTab;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        bottomNavigationBar: CustomBottomNavigation(
          iconlist: [
            Icons.home_work_outlined,
            Icons.info_outline,
            Icons.supervised_user_circle_outlined,
          ],
          iconListSelected: [
            Icons.home,
            Icons.info,
            Icons.supervised_user_circle,
          ],
          name: ["Home", "Booking", "Profile"],
          onChange: (val) {
            setState(() {
              _selectedIndex = val;
            });
          },
          defaultSelectedIndex: 0,
        ),
        body: Stack(
          children: [
            _buildOffstageNavigator(0),
            _buildOffstageNavigator(1),
            _buildOffstageNavigator(2),
          ],
        ),
      ),
    );
  }

  void _next() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Screen4()));
  }

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context, int index) {
    return {
      '/': (context) {
        return [
          Screen1(),
          Screen2(),
          Screen3(
            onNext: _next,
          ),
        ].elementAt(index);
      },
    };
  }

  Widget _buildOffstageNavigator(int index) {
    var routeBuilders = _routeBuilders(context, index);

    return Offstage(
      offstage: _selectedIndex != index,
      child: Navigator(
        key: _navigatorKeys[index],
        onGenerateRoute: (routeSettings) {
          return MaterialPageRoute(
            builder: (context) => routeBuilders[routeSettings.name]!(context),
          );
        },
      ),
    );
  }
}
