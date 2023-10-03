import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testapp/models/provider/name_provider.dart';
import 'package:testapp/utils/colors.dart';
import 'package:testapp/utils/text_styles.dart';

Widget categoryRow(BuildContext context) {
  double screenWidth = MediaQuery.of(context).size.width;
  String name = Provider.of<NameProvider>(context).name;

  return Consumer<NameProvider>(
      builder: (context, model, child) => SizedBox(
            width: 800,
            height: 100,
            child: Stack(children: [
              Positioned(
                  top: 40,
                  left: 30,
                  child: Container(
                      width: screenWidth * 0.75,
                      height: 55,
                      decoration:
                          const BoxDecoration(color: Colores.greenDark))),
              Positioned(
                  left: 10,
                  child: Container(
                      width: screenWidth * 0.70,
                      height: 75,
                      decoration: const BoxDecoration(color: Colores.orange),
                      child: Center(
                        child: Text(
                          name,
                        ).nameTextStyle(),
                      ))),
            ]),
          ));
}
