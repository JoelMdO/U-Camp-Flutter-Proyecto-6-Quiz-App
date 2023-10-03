import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testapp/models/provider/count_provider.dart';
import 'package:testapp/utils/colors.dart';
import 'package:testapp/utils/text_styles.dart';
import 'package:testapp/widgets/buttons/green_button.dart';

class TotalHitsOpenDialog {
  final int totalAnswers;
  TotalHitsOpenDialog({required this.totalAnswers});

  String image = '';

  void answers() {
    if (totalAnswers == 10) {
      image = 'assets/GoldMedal.png';
    } else if (totalAnswers < 10 && totalAnswers >= 7) {
      image = 'assets/PurpleMedal.png';
    } else if (totalAnswers < 7 && totalAnswers >= 5) {
      image = 'assets/RedMedal.png';
    } else {
      image = 'assets/UglyFace.png';
    }
  }

  Future<void> openDA(BuildContext context) async {
    double screenWidth = MediaQuery.of(context).size.width / 2;
    double screenHeight = MediaQuery.of(context).size.height / 2;
    Provider.of<CountProvider>(context, listen: false)
        .setFinalCount(totalAnswers);
    answers();
    return showDialog<void>(
        context: context,
        builder: (BuildContext _) {
          return AlertDialog(
            content: buildContentDialog(screenHeight, screenWidth),
            actions: const <Widget>[
              GreenButton(name: 'END'),
              GreenButton(name: 'RE-START')
            ],
          );
        });
  }

  ///content:
  Widget buildContentDialog(double screenWidth, double screenHeight) {
    return FittedBox(
      fit: BoxFit.fitWidth,
      child: SizedBox(
          width: 200,
          height: 250,
          child: Container(
              decoration: const BoxDecoration(
                color: Colores.white,
              ),
              child: Stack(fit: StackFit.loose, children: [
                Positioned(
                    left: 10,
                    top: 15,
                    child: const Text('Total Hits').answerFinalTextStyle()),
                Padding(
                    padding: const EdgeInsets.only(top: 40, left: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(totalAnswers.toString())
                            .answerFinalNumberTextStyle(),
                        Image.asset(image),
                      ],
                    )),
                Positioned(
                    left: 40,
                    top: 165,
                    child: Container(
                      color: Colores.greenDark,
                      width: 120,
                      height: 10,
                    )),
                Positioned(
                    left: 30,
                    top: 175,
                    child: Container(
                      color: Colores.yellow,
                      width: 110,
                      height: 10,
                    )),
                Positioned(
                    left: 20,
                    top: 185,
                    child: Container(
                      color: Colores.greenDark,
                      width: 100,
                      height: 8,
                    )),
              ]))),
    );
  }
}
