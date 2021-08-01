import 'package:flutter/material.dart';

Color mBackgroundColor = Color(0xFFFFFFFF);

Color mPrimaryColor = Color(0xFF24AE5F);

Color mDangerColor = Color(0xFFE64A19);

Color mSecondColor = Color(0xFF78CAB3);

Color mPrimaryTextColor = Color(0xFF318655);

Color mSecondTextColor = Color(0xFF98CBBD);

const kTextColorLight = Color(0xFF778080);

const kTextColorDark = Color(0xFF2c3e50);

const kBackgroundLight = Color(0xffecf0f1);

const kBackgroundLightGrey = Color(0xffbdc3c7);

LinearGradient mPBGradientColor = LinearGradient(
  colors: [mPrimaryColor.withOpacity(0.3), mPrimaryColor.withOpacity(0.015)],
  begin: Alignment.bottomCenter,
  end: Alignment.topCenter,
);
const double fButtonTextSize = 16;
const double fBodyTextSizeSmall = 13;
const double fBodyTextSizeMedium = 15;
const double fLabelTextSize = 14;

const double pHorizontalSmall = 8;
const double pHorizontal = 16;
const double pVertical = 10;
const double pVerticalSmall = 4;

///////////////////////////////////////////////////
///styles
//////////////////////////////////////////////////
TextStyle textNormalStyle = new TextStyle(
  fontSize: fBodyTextSizeMedium,
  color: kTextColorLight,
);

TextStyle bodyItemStyle = new TextStyle(
  fontSize: fBodyTextSizeSmall,
  color: kTextColorLight,
);
///////////////////////////////////////////////////
///styles
//////////////////////////////////////////////////

const double iconSizeSmall = 14;
const double iconSizeMedium = 16;
const double iconSizeLarge = 20;
const double iconSizeXXXL = 70;

///////////////////////////////////////////////////

///////////////////////////////////////////////////
///SharedPreference variables
///////////////////////////////////////////////////
const String sFUserLoginStatus = "sFUserLoginStatus";
const String kUpdateDialogKeyName = "kUpdateDialogKey";
const String eUserId = "eUserId";
///////////////////////////////////////////////////
///SharedPreference variables
///////////////////////////////////////////////////
