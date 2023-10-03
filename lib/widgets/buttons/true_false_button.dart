import 'package:flutter/material.dart';
import 'package:testapp/utils/colors.dart';
import 'package:testapp/utils/text_styles.dart';
import 'package:testapp/utils/logic_buttons/true_false_button_logic.dart';

class TrueFalseButton extends StatelessWidget {
  final String type, name, question;
  final int index;
  TrueFalseButton({
    Key? key,
    required this.type,
    required this.index,
    required this.name,
    required this.question,
  }) : super(key: key);

  int count = 0;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          trueFalseButtonLogic(context, name, index, type, question);
        },
        child: Material(
          elevation: 10,
          child: Container(
            height: 30,
            width: 70,
            decoration: const BoxDecoration(color: Colores.orange),
            child: Align(
                alignment: Alignment.center,
                child: Stack(children: [
                  Text(type).orangeButtonTextStrokeStyle(),
                  Text(
                    type,
                  ).orangeButtonTextStyle(),
                ])),
          ),
        ));
  }
}
