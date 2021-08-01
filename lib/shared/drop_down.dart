import 'package:flutter/material.dart';
import 'package:cook_book_flutter/utils/constant.dart';

class DropdownButtonField extends StatelessWidget {
  const DropdownButtonField({
    Key? key,
    required this.value,
    required this.labels,
    required this.onChanged,
    this.hint,
    this.haveIconForHint,
    this.icon,
    this.color,
  }) : super(key: key);

  final String value;
  final String? hint;
  final IconData? icon;
  final Color? color;
  final bool? haveIconForHint;
  final List<String> labels;
  final ValueChanged<String?>? onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: value,
      hint: haveIconForHint!
          ? Icon(
              icon,
              color: color,
            )
          : Text(
              hint!,
              style: TextStyle(
                color: mPrimaryColor,
              ),
            ),
      isExpanded: true,
      elevation: 16,
      style: TextStyle(color: mPrimaryTextColor),
      underline: Container(
        height: 0.5,
        color: Colors.grey,
      ),
      onChanged: onChanged,
      items: labels.map((String dropDownStringItem) {
        return DropdownMenuItem<String>(
          value: dropDownStringItem,
          child: Text(dropDownStringItem),
        );
      }).toList(),
    );
  }
}
