import 'package:cook_book_flutter/utils/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InputTextArea extends StatelessWidget {
  const InputTextArea({
    required this.hint,
    this.icons,
    required this.textEditingController,
    required this.isEnable,
  });

  final String hint;
  final bool isEnable;
  final Icon? icons;
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: [
          Container(
            height: 100,
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
              controller: textEditingController,
              keyboardType: TextInputType.multiline,
              textInputAction: TextInputAction.newline,
              minLines: 1,
              maxLines: 5,
            ),
          ),
        ],
      ),
    );
  }
}
