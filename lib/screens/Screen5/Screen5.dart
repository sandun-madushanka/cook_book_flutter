import 'package:cook_book_flutter/screens/widget/main_home_screen.dart';
import 'package:cook_book_flutter/shared/button_material_round.dart';
import 'package:cook_book_flutter/utils/constant.dart';
import 'package:flutter/material.dart';

class Screen5 extends StatelessWidget {
  const Screen5({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text("Screen 5"),
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
                              builder: (context) => MainHomeScreen()));
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
