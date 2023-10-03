import 'package:flutter/material.dart';
import 'package:testapp/utils/colors.dart';
import 'package:testapp/utils/text_styles.dart';
import 'package:testapp/widgets/buttons/green_button.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(color: Colors.white),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Padding(padding: EdgeInsets.only(top: 30)),
          Align(
              alignment: Alignment.centerRight,
              child: Image.asset(
                'assets/J code.png',
                width: 35,
                height: 35,
              )),
          const Padding(
            padding: EdgeInsets.only(top: 40),
          ),
          Row(
            children: [
              Container(
                  width: screenWidth * 0.90,
                  height: 120,
                  decoration: const BoxDecoration(color: Colores.orange),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: const Text(
                      'Test',
                    ).testTitleStyle(),
                  )),
              Container(
                width: screenWidth * 0.10,
                height: 120,
                decoration: const BoxDecoration(color: Colores.white),
              )
            ],
          ),
          Container(
              width: screenWidth,
              height: 85,
              decoration: const BoxDecoration(color: Colores.white),
              child: Padding(
                padding: const EdgeInsets.only(left: 90),
                child: const Text(
                  'your',
                ).yourTextStyle(),
              )),
          Row(
            children: [
              Container(
                width: screenWidth * 0.50,
                height: 75,
                decoration: const BoxDecoration(color: Colores.white),
              ),
              Container(
                  width: screenWidth * 0.45,
                  height: 75,
                  decoration: const BoxDecoration(color: Colores.greenDark),
                  child: Align(
                    alignment: Alignment.center,
                    child: const Text(
                      'Self',
                    ).selfTextStyle(),
                  ))
            ],
          ),
          Padding(
              padding: const EdgeInsets.only(top: 60, left: 20),
              child: const Text('Select a Topic:').selectATopicTextStyle()),
          const Row(
            children: [
              Padding(
                  padding: EdgeInsets.only(top: 10, left: 30),
                  child: GreenButton(name: 'Culture')),
              Padding(
                  padding: EdgeInsets.only(left: 20, top: 20),
                  child: GreenButton(name: 'Sports')),
              Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: GreenButton(name: 'Math\'s')),
            ],
          ),
        ]),
      ),
    );
  }
}
