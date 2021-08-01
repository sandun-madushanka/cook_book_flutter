import 'package:cook_book_flutter/screens/Screen4/Screen4.dart';
import 'package:cook_book_flutter/shared/button_material_round.dart';
import 'package:cook_book_flutter/shared/button_primary_rect.dart';
import 'package:cook_book_flutter/shared/button_primary_round.dart';
import 'package:cook_book_flutter/utils/constant.dart';
import 'package:flutter/material.dart';

class Screen3 extends StatefulWidget {
  const Screen3({Key? key, this.onNext}) : super(key: key);

  final VoidCallback? onNext;

  @override
  _Screen3State createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text("Screen 3"),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: ButtonPrimaryRound(
                    btnName: "Go to Next Screen",
                    isOutlineButton: false,
                    onBtnClick: widget.onNext!,
                    colors: mPrimaryColor),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: ButtonPrimaryRound(
                    btnName: "Go to Next Screen",
                    isOutlineButton: true,
                    onBtnClick: widget.onNext!,
                    colors: mPrimaryColor),
              ),
            ),
            Center(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: ButtonPrimaryRect(
                    btnName: "Go to Next Screen",
                    isOutlineButton: false,
                    onBtnClick: widget.onNext!,
                    colors: mPrimaryColor),
              ),
            ),
            Center(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: ButtonPrimaryRect(
                    btnName: "Go to Next Screen",
                    isOutlineButton: true,
                    onBtnClick: widget.onNext!,
                    colors: mPrimaryColor),
              ),
            ),
            Center(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: ButtonMaterialCustom(
                    btnName: "Go to Next Screen",
                    isOutlineButton: false,
                    onBtnClick: widget.onNext!,
                    colors: mPrimaryColor),
              ),
            ),
            Center(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: ButtonMaterialCustom(
                    btnName: "Go to Next Screen",
                    isOutlineButton: true,
                    onBtnClick: widget.onNext!,
                    colors: mPrimaryColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
