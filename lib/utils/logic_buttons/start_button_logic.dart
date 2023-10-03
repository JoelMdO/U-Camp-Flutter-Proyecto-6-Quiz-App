import 'package:flutter/material.dart';
import 'package:testapp/pages/test_page.dart';

void startButtonLogic(BuildContext context) {
  Navigator.of(context).push(MaterialPageRoute(
    builder: (BuildContext context) => const TestPage(),
  ));
}
