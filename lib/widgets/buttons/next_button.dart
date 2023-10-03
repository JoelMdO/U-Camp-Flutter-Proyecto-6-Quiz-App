import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testapp/models/provider/count_provider.dart';
import 'package:testapp/models/provider/index_provider.dart';
import 'package:testapp/utils/colors.dart';
import 'package:testapp/utils/logic_buttons/next_button_logic.dart';
import 'package:testapp/utils/text_styles.dart';

class NextButton extends StatefulWidget {
  final String typeAnswer;
  const NextButton({Key? key, required this.typeAnswer}) : super(key: key);

  @override
  State<NextButton> createState() => _NextButtonState();
}

class _NextButtonState extends State<NextButton> {
  bool isCorrect = false;

  @override
  void initState() {
    if (widget.typeAnswer == 'Correct') {
      isCorrect = true;
    } else {
      isCorrect = false;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int index = Provider.of<IndexProvider>(context).index;
    int count = Provider.of<CountProvider>(context).count;

    return InkWell(
        onTap: () {
          nextButtonLogic(context, index, count);
        },
        child: Container(
            width: 60,
            height: 40,
            decoration:
                BoxDecoration(color: isCorrect ? Colores.blue : Colores.red),
            child: Align(
              alignment: Alignment.center,
              child: const Text('Next').nextButtonTextStyle(),
            )));
  }
}
