import 'package:flutter/material.dart';
import 'package:testapp/pages/rank_page.dart';
import 'package:intl/intl.dart';

void buttonEndLogic(BuildContext context, int count) {
  final now = DateTime.now();
  final date = DateFormat.yMMMMd('en_US').format(now).toString();

  Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) =>
          RankPage(totalHits: count, date: date)));
}
