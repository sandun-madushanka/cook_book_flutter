import 'package:cook_book_flutter/utils/constant.dart';
import 'package:flutter/material.dart';

AppBar buildAppBar(BuildContext context, String title, VoidCallback function,
    Color color, bool isPrimary) {
  return AppBar(
    backgroundColor: color,
    elevation: 0,
    centerTitle: true,
    title: Text(
      title,
      style: TextStyle(
        color: isPrimary ? mBackgroundColor : mPrimaryColor,
      ),
    ),
    leading: IconButton(
      icon: Icon(
        Icons.arrow_back_ios,
        color: isPrimary ? mBackgroundColor : mPrimaryColor,
      ),
      onPressed: function,
    ),
  );
}
