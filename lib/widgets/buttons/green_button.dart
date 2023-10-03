import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testapp/models/provider/count_provider.dart';
import 'package:testapp/utils/logic_buttons/green_button_logic.dart';
import 'package:testapp/utils/colors.dart';
import 'package:testapp/utils/text_styles.dart';

class GreenButton extends StatefulWidget {
  final String name;
  const GreenButton({Key? key, required this.name}) : super(key: key);

  @override
  State<GreenButton> createState() => _GreenButtonState();
}

class _GreenButtonState extends State<GreenButton> {
  bool isTapped = false;
  bool isEnd = false;

  @override
  Widget build(BuildContext context) {
    int count = Provider.of<CountProvider>(context).count;
    return InkWell(
        onTap: () {
          greenButtonLogic(context, widget.name, count);
          setState(() {
            isTapped = true;
            isEnd = true;
          });
        },
        child: CircleAvatar(
            backgroundColor: isTapped ? Colores.red : Colores.greenDark,
            radius: 48,
            child: CircleAvatar(
                backgroundColor: isTapped
                    ? Colores.orange
                    : isEnd
                        ? Colores.greenLightDark
                        : Colores.greenLight,
                radius: 40,
                child: Text(widget.name).greenButtonTextStyle())));
  }
}
