import 'package:cook_book_flutter/utils/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InputTextField extends StatelessWidget {
  const InputTextField({
    Key? key,
    required this.label,
    this.onChange,
    this.isPassword = false,
    this.icons,
    required this.textEditingController,
    required this.keyboardType,
    required this.isEnable,
  }) : super(key: key);

  final String label;
  final Function(String)? onChange;
  final bool isPassword;
  final bool isEnable;
  final Icon? icons;
  final TextEditingController textEditingController;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: isEnable,
      keyboardType: keyboardType,
      controller: textEditingController,
      obscureText: isPassword,
      onChanged: onChange,
      decoration: InputDecoration(
        prefixIcon: icons,
        labelText: label,
        labelStyle: TextStyle(
          color: Colors.grey,
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(
            color: mPrimaryColor,
            width: 2,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: mPrimaryColor,
            width: 2,
          ),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
            width: 0.5,
          ),
        ),
      ),
    );
  }
}
