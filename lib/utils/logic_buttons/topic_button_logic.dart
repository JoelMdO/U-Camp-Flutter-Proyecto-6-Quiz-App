import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testapp/models/provider/name_provider.dart';
import 'package:testapp/pages/ready_page.dart';

void buttonTopicLogicRoute(BuildContext context, String name) {
  Provider.of<NameProvider>(context, listen: false).setName(name);
  Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) => ReadyPage(
            name: name,
          )));
}
