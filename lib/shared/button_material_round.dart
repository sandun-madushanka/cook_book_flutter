import 'package:cook_book_flutter/utils/constant.dart';
import 'package:flutter/material.dart';

class ButtonMaterialCustom extends StatelessWidget {
  const ButtonMaterialCustom({
    required this.btnName,
    required this.isOutlineButton,
    required this.onBtnClick,
    required this.colors,
    this.icon,
  });

  final String btnName;
  final bool isOutlineButton;
  final VoidCallback onBtnClick;
  final Color colors;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        onPressed: onBtnClick,
        color: isOutlineButton ? mBackgroundColor : colors,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: isOutlineButton
              ? BorderSide(color: colors)
              : BorderSide(color: colors),
        ),
        child: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            icon != null
                ? Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Icon(
                      icon,
                      color: isOutlineButton ? colors : mBackgroundColor,
                    ),
                  )
                : Text(''),
            Text(
              btnName,
              style: TextStyle(
                  color: isOutlineButton ? colors : mBackgroundColor,
                  fontSize: 14),
            ),
          ],
        ));
  }
}
