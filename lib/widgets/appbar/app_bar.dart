import 'package:flutter/material.dart';
import 'package:testapp/utils/colors.dart';

class PersonalAppBar extends AppBar {
  PersonalAppBar({super.key})
      : super(
            title: const Text(''),
            flexibleSpace: Row(
              children: [
                Container(
                  width: 300,
                  height: 65,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Colores.greenLightDark,
                      Colores.orange,
                      Colores.cream
                    ]),
                  ),
                ),
                Container(
                    width: 50,
                    height: 65,
                    decoration: const BoxDecoration(color: Colores.white),
                    child: Padding(
                        padding: const EdgeInsets.only(left: 25),
                        child: Image.asset(
                          'assets/J code.png',
                          width: 35,
                          height: 35,
                        )))
              ],
            ));
}
