import 'package:flutter/material.dart';
import 'package:testapp/utils/colors.dart';
import 'package:testapp/utils/text_styles.dart';
import 'package:testapp/widgets/buttons/next_button.dart';

class AnswerOpenDialog {
  final String option;

  AnswerOpenDialog({required this.option});

  Future<void> openDA(BuildContext context) async {
    double screenWidth = MediaQuery.of(context).size.width / 2;
    double screenHeight = MediaQuery.of(context).size.height / 2;

    return showDialog<void>(
        context: context,
        builder: (BuildContext _) {
          return AlertDialog(
            content: buildContentDialog(screenHeight, screenWidth),
            actions: <Widget>[NextButton(typeAnswer: option)],
          );
        });
  }

  ///content:
  Widget buildContentDialog(double screenWidth, double screenHeight) {
    return FittedBox(
        fit: BoxFit.fitWidth,
        child: SizedBox(
            width: 200,
            height: 100,
            child: Container(
              decoration: BoxDecoration(
                  color: Colores.white,
                  border: Border.all(
                      width: 2,
                      color: option == 'Correct' ? Colores.blue : Colores.red)),
              child: Stack(fit: StackFit.loose, children: [
                Positioned(
                    left: 85,
                    top: 15,
                    child: Text(option).answerButtonTextStyle()),
                Positioned(
                    left: 70,
                    top: 45,
                    child: Container(
                      color: Colores.greenDark,
                      width: 90,
                      height: 10,
                    )),
                Positioned(
                    left: 70,
                    top: 55,
                    child: Container(
                      color: option == 'Correct'
                          ? Colores.greenLight
                          : Colores.red,
                      width: 80,
                      height: 10,
                    )),
                Positioned(
                    left: 70,
                    top: 65,
                    child: Container(
                      color: Colores.greenDark,
                      width: 70,
                      height: 8,
                    )),
                Image.asset(option == 'Correct'
                    ? 'assets/TumbUp.png'
                    : 'assets/Cross.png'),
              ]),
            )));
  }

  ///actions:
  Widget buildContentActionsDialog(double screenWidth, double screenHeight) {
    return Row(mainAxisAlignment: MainAxisAlignment.end, children: [
      NextButton(
        typeAnswer: option,
      ),
    ]);
  }
}
