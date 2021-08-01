import 'package:cook_book_flutter/utils/constant.dart';
import 'package:flutter/material.dart';

class PopupMenuButtonSquare extends StatelessWidget {
  const PopupMenuButtonSquare({
    required this.value,
    required this.isExpanded,
    required this.labels,
    required this.onChanged,
    this.hint,
  });

  final String? value;
  final String? hint;
  final bool isExpanded;
  final List<String> labels;
  final ValueChanged<String?>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: pHorizontal, vertical: 4),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(8),
                    bottomRight: Radius.circular(0),
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(0)),
                border: Border.all(color: kBackgroundLightGrey)),
            child: Text(
              '$value',
              style: textNormalStyle,
            ),
          ),
          Container(
            height: 28,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(8),
                    topLeft: Radius.circular(0),
                    topRight: Radius.circular(8)),
                border: Border.all(color: kBackgroundLightGrey)),
            child: PopupMenuButton<String>(
              iconSize: 40,
              child: Icon(
                Icons.arrow_drop_down_sharp,
              ),
              padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
              onSelected: onChanged,
              itemBuilder: (BuildContext context) {
                return labels.map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList();
              },
            ),

            // DropdownButton<String>(
            //   items: labels.map((String value) {
            //     return DropdownMenuItem<String>(
            //       value: value,
            //       child: new Text(value),
            //     );
            //   }).toList(),
            //   isExpanded: isExpanded,
            //   style: TextStyle(
            //     color: kTextColorDark,
            //   ),
            //   underline: Container(
            //     height: 0,
            //     color: mBackgroundColor,
            //   ),
            //   onChanged: onChanged,
            // ),
          ),
        ],
      ),
    );
    DropdownButton<String>(
      value: value,
      hint: Text(
        '$hint',
        style: TextStyle(
          color: mPrimaryColor,
        ),
      ),
      isExpanded: isExpanded,
      elevation: 16,
      style: TextStyle(
        color: mPrimaryColor,
      ),
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

// void choiceAction(String choice) {
//   if (choice == Constants.FirstItem) {
//     print('I First Item');
//   } else if (choice == Constants.SecondItem) {
//     print('I Second Item');
//   } else if (choice == Constants.ThirdItem) {
//     print('I Third Item');
//   }
// }
