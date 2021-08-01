import 'package:cook_book_flutter/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingSpin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: mBackgroundColor,
      child: Center(
        child: SpinKitFadingCircle(
          color: mPrimaryColor,
          size: 50.0,
        ),
      ),
    );
  }
}
