import 'dart:io';

import 'package:cook_book_flutter/update_app/do_not_ask_again_dialog.dart';
import 'package:cook_book_flutter/utils/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';
import 'package:pub_semver/pub_semver.dart';
import 'package:url_launcher/url_launcher.dart';

class UpdateApp extends StatefulWidget {
  final Widget? child;

  UpdateApp({this.child});

  @override
  _UpdateAppState createState() => _UpdateAppState();
}

class _UpdateAppState extends State<UpdateApp> {
  List appVersionList = [];

  @override
  void initState() {
    super.initState();

    checkLatestVersion(context);
  }

  checkLatestVersion(context) async {
    await Future.delayed(Duration(seconds: 5));

    //Add query here to get the minimum and latest app version
    // final response = await apiService.getAppVersion();

    appVersionList.clear();

    //Change
    //Parse the result here to get the info
    // Version minAppVersion = Version.parse('1.2.3-pre');
    // Version latestAppVersion = Version.parse('2.0.0+123');

    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    Version currentVersion = Version.parse(packageInfo.version);
    print(packageInfo.version);

    // Version minAppVersion = Version.parse(response.content!.minAppVersion!);
    // Version latestAppVersion = Version.parse(response.content!.version!);
    Version minAppVersion = Version.parse("1.0.0");
    Version latestAppVersion = Version.parse("1.0.0");

    if (minAppVersion > currentVersion) {
      _showCompulsoryUpdateDialog(
        context,
        // "Please update the app to continue\n${response.content!.about ?? ""}",
        "Please update the app to continue\n Some Message from server",
      );
    } else if (latestAppVersion > currentVersion) {
      // SharedPreferences sharedPreferences =
      //     await SharedPreferences.getInstance();
      //
      // bool? showUpdates = false;
      // showUpdates = sharedPreferences.getBool(kUpdateDialogKeyName)!;
      //
      // if (showUpdates != null && showUpdates == false) {
      //   return;
      // }

      _showOptionalUpdateDialog(
        context,
        // "A newer version of the app is available\n${response.content!.about ?? ""}",
        "A newer version of the app is available\n Some message from server",
      );
      print('Update available');
    } else {
      print('App is up to date');
    }
  }

  _showOptionalUpdateDialog(context, String message) async {
    await showDialog<String>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        String title = "App Update Available";
        String btnLabel = "Update Now";
        String btnLabelCancel = "Later";
        String btnLabelDontAskAgain = "Don't ask me again";
        return DoNotAskAgainDialog(
          kUpdateDialogKeyName,
          title,
          message,
          btnLabel,
          btnLabelCancel,
          _onUpdateNowClicked,
          doNotAskAgainText:
              Platform.isIOS ? btnLabelDontAskAgain : 'Never ask again',
        );
      },
    );
  }

  _onUpdateNowClicked() async {
    print('On update app clicked');
    // await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';
    await launch(appVersionList[0].appUrl!);
  }

  _showCompulsoryUpdateDialog(context, String message) async {
    await showDialog<String>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        String title = "App Update Available";
        String btnLabel = "Update Now";
        return Platform.isIOS
            ? new CupertinoAlertDialog(
                title: Text(title),
                content: Text(message),
                actions: <Widget>[
                  CupertinoDialogAction(
                    child: Text(
                      btnLabel,
                    ),
                    isDefaultAction: true,
                    onPressed: _onUpdateNowClicked,
                  ),
                ],
              )
            : new AlertDialog(
                title: Text(
                  title,
                  style: TextStyle(fontSize: 22),
                ),
                content: Text(message),
                actions: <Widget>[
                  FlatButton(
                    child: Text(btnLabel),
                    onPressed: _onUpdateNowClicked,
                  ),
                ],
              );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return widget.child!;
  }
}
