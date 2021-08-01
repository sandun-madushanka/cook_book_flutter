import 'package:cook_book_flutter/utils/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InputTextFieldWIthBorders extends StatelessWidget {
  const InputTextFieldWIthBorders({
    required this.lable,
    required this.hint,
    this.isPassword = false,
    this.icons,
    required this.textEditingController,
    required this.keyboardType,
    required this.isEnable,
  });

  final String lable, hint;
  final bool isPassword;
  final bool isEnable;
  final Icon? icons;
  final TextEditingController textEditingController;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            child: Text(
              '$lable',
              style: TextStyle(
                color: kTextColorDark,
                fontWeight: FontWeight.w400,
                fontSize: fLabelTextSize,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: kBackgroundLightGrey)),
            child: TextField(
              style: TextStyle(
                color: kTextColorDark,
                fontSize: fLabelTextSize,
              ),
              decoration: InputDecoration(
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                hintText: "$hint",
                hintStyle: TextStyle(
                  color: kTextColorLight,
                  fontSize: fLabelTextSize,
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 9,
                ),
              ),
              enabled: isEnable,
              keyboardType: keyboardType,
              controller: textEditingController,
              obscureText: isPassword,
            ),
          ),
        ],
      ),
    );
  }
}
