import 'package:cook_book_flutter/screens/widget/main_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    var d = Duration(seconds: 3);
    //delayed 3 seconds to next page
    Future.delayed(d, () async {
      //to next page and close this page

      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) {
          return MainHomeScreen();
        }),
        (route) => false,
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(child: Text("Splash Screen")),
        // child: Center(child: SvgPicture.asset('assets/images/logo.svg')),
      ),
    );
  }
}
