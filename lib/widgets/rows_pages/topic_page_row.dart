import 'package:flutter/material.dart';
import 'package:testapp/utils/colors.dart';
import 'package:testapp/utils/text_styles.dart';

Widget topicRow(BuildContext context) {
  double screenWidth = MediaQuery.of(context).size.width;

  return Row(
    children: [
      Container(
          width: screenWidth * 0.75,
          height: 55,
          decoration: const BoxDecoration(color: Colores.greenDark),
          child: Align(
            alignment: AlignmentDirectional.topStart,
            child: const Text(
              'Topic',
            ).topicTextStyle(),
          )),
      Container(
        width: screenWidth * 0.25,
        height: 55,
        decoration: const BoxDecoration(color: Colores.white),
      ),
    ],
  );
}
