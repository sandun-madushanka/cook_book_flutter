import 'package:cook_book_flutter/models/MyChoice.dart';
import 'package:cook_book_flutter/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ButtonRadioCustom extends StatefulWidget {
  final List<MyChoice> choices;
  final String defaultChoice;
  final int defaultIndex;

  const ButtonRadioCustom(
      {required this.choices,
      required this.defaultChoice,
      required this.defaultIndex});

  @override
  _ButtonRadioCustomState createState() =>
      _ButtonRadioCustomState(this.defaultChoice, this.defaultIndex);
}

class _ButtonRadioCustomState extends State<ButtonRadioCustom> {
  String? defaultChoice;
  int? defaultIndex;

  _ButtonRadioCustomState(String defaultChoiceR, int defaultIndexR) {
    defaultChoice = defaultChoiceR;
    defaultIndex = defaultIndexR;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Wrap(
          children: [
            Container(
              child: Column(
                children: widget.choices
                    .map((data) => RadioListTile(
                          activeColor: mPrimaryColor,
                          title: Text('${data.choice}'),
                          groupValue: widget.defaultIndex,
                          value: data.index,
                          onChanged: (value) {
                            setState(() {
                              defaultChoice = data.choice;
                              defaultIndex = data.index;
                              Fluttertoast.showToast(msg: defaultChoice!);
                            });
                          },
                        ))
                    .toList(),
              ),
            )
          ],
        ),
      ],
    );
  }
}
