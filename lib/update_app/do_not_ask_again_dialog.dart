import 'dart:io';

import 'package:cook_book_flutter/utils/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DoNotAskAgainDialog extends StatefulWidget {
  final String title, subTitle, positiveButtonText, negativeButtonText;
  final VoidCallback onPositiveButtonClicked;
  final String doNotAskAgainText;
  final String dialogKeyName;

  DoNotAskAgainDialog(
    this.dialogKeyName,
    this.title,
    this.subTitle,
    this.positiveButtonText,
    this.negativeButtonText,
    this.onPositiveButtonClicked, {
    this.doNotAskAgainText = 'Never ask again',
  });

  @override
  _DoNotAskAgainDialogState createState() => _DoNotAskAgainDialogState();
}

class _DoNotAskAgainDialogState extends State<DoNotAskAgainDialog> {
  bool doNotAskAgain = false;

  _updateDoNotShowAgain() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setBool(kUpdateDialogKeyName, false);
  }

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoAlertDialog(
        title: Text(widget.title),
        content: Text(
          widget.subTitle,
          style: bodyItemStyle,
        ),
        actions: <Widget>[
          CupertinoDialogAction(
            child: Text(
              widget.positiveButtonText,
            ),
            onPressed: widget.onPositiveButtonClicked,
          ),
          CupertinoDialogAction(
            child: Text(
              widget.doNotAskAgainText,
            ),
            onPressed: () {
              Navigator.pop(context);
              _updateDoNotShowAgain();
            },
          ),
          CupertinoDialogAction(
            child: Text(
              widget.negativeButtonText,
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      );
    }
    return AlertDialog(
      title: Text(
        widget.title,
        style: TextStyle(fontSize: 24),
      ),
      content: FittedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              widget.subTitle,
              style: bodyItemStyle,
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: Text(widget.positiveButtonText),
          onPressed: doNotAskAgain ? null : widget.onPositiveButtonClicked,
        ),
        TextButton(
          child: Text(
            widget.negativeButtonText,
            style: TextStyle(color: Colors.red),
          ),
          onPressed: () async {
            Navigator.pop(context);
            if (doNotAskAgain) {
              _updateDoNotShowAgain();
            }
          },
        ),
      ],
    );
  }
}
