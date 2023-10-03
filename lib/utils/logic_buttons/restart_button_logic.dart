import 'package:flutter/material.dart';
import 'package:testapp/pages/home.dart';

void reStartButtonLogic(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (BuildContext context) => const Home()));
}
