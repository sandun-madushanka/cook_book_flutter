import 'package:cook_book_flutter/screens/widget/main_home2.dart';
import 'package:cook_book_flutter/shared/button_material_round.dart';
import 'package:cook_book_flutter/utils/constant.dart';
import 'package:flutter/material.dart';

class Screen4 extends StatelessWidget {
  const Screen4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text("Screen 4"),
            Center(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: ButtonMaterialCustom(
                    btnName: "Go to Next Screen",
                    isOutlineButton: true,
                    onBtnClick: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MainHomeScreen2()));
                    },
                    colors: mPrimaryColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
