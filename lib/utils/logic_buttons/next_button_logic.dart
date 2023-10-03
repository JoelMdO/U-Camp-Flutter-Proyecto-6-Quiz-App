import 'package:flutter/material.dart';
import 'package:testapp/widgets/dialogs/total_hits_dialog.dart';

void nextButtonLogic(BuildContext context, int index, int count) {
  if (index == 9) {
    final total = count;
    TotalHitsOpenDialog(totalAnswers: total).openDA(context);
  } else {
    Navigator.of(context).pop();
  }
}
