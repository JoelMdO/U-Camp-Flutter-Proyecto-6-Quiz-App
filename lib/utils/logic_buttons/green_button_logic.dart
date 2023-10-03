import 'package:flutter/material.dart';
import 'package:testapp/utils/logic_buttons/end_button_logic.dart';
import 'package:testapp/utils/logic_buttons/restart_button_logic.dart';
import 'package:testapp/utils/logic_buttons/start_button_logic.dart';
import 'package:testapp/utils/logic_buttons/topic_button_logic.dart';

void greenButtonLogic(BuildContext context, String name, int count) {
  switch (name) {
    case 'Culture':
      buttonTopicLogicRoute(context, 'Culture');
      break;
    case 'Sports':
      buttonTopicLogicRoute(context, 'Sports');
      break;
    case 'Math\'s':
      buttonTopicLogicRoute(context, 'Math\'s');
      break;
    case 'START':
      startButtonLogic(context);
      break;
    case 'RE-START':
      reStartButtonLogic(context);
      break;
    case 'END':
      buttonEndLogic(context, count);
      break;
  }
}
