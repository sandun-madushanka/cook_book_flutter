import 'package:cook_book_flutter/providers/list_provider.dart';
import 'package:cook_book_flutter/screens/authentication/splash_screen.dart';
import 'package:cook_book_flutter/update_app/update_app.dart';
import 'package:cook_book_flutter/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    // return ChangeNotifierProvider<MyCart>(
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ListProvider>(
          create: (_) => ListProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Cook Book',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: mBackgroundColor,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        builder: (context, widget) => Navigator(
          onGenerateRoute: (settings) => MaterialPageRoute(
            builder: (context) => UpdateApp(
              child: widget,
            ),
          ),
        ),
        home: SplashScreen(),
      ),
    );
  }
}
