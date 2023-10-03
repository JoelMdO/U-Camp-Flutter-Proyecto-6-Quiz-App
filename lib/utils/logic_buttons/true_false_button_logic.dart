import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testapp/models/database_helper.dart';
import 'package:testapp/models/provider/count_provider.dart';
import 'package:testapp/models/provider/index_provider.dart';
import 'package:testapp/widgets/dialogs/answer_dialog.dart';

void trueFalseButtonLogic(
    BuildContext context, name, index, type, question) async {
  final indexProvider = Provider.of<IndexProvider>(context, listen: false);
  final countProvider = Provider.of<CountProvider>(context, listen: false);
  String getAnswer = await DatabaseHelper.instance.getAnswers(question, index);
  if (index < 9) {
    indexProvider.updateIndex();
    //
    print('FalseButtonAnswer:$getAnswer');
    print('FalseButtonType:$type');
    if (getAnswer == type) {
      countProvider.setFinalCount(countProvider.count + 1);
      // ignore: use_build_context_synchronously
      AnswerOpenDialog(option: 'Correct').openDA(context);
    } else {
      countProvider.setFinalCount(countProvider.count - 1);
      // ignore: use_build_context_synchronously
      AnswerOpenDialog(option: 'Wrong').openDA(context);
    }
  } else {
    // Handle the case where index is out of bounds (you might want to show an error message).
    print('Index out of bounds: $index');
  }
}
