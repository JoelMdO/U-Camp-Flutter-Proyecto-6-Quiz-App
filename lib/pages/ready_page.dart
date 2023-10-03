import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testapp/models/provider/name_provider.dart';
import 'package:testapp/utils/text_styles.dart';
import 'package:testapp/widgets/appbar/app_bar.dart';
import 'package:testapp/widgets/buttons/green_button.dart';
import 'package:testapp/widgets/rows_pages/category_page_row.dart';
import 'package:testapp/widgets/rows_pages/topic_page_row.dart';

class ReadyPage extends StatelessWidget {
  final String name;
  const ReadyPage({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<NameProvider>(
        create: (_) => NameProvider(),
        child: Scaffold(
            appBar: PersonalAppBar(),
            body: SafeArea(
                top: true,
                left: true,
                bottom: true,
                right: true,
                child: Container(
                  decoration: const BoxDecoration(color: Colors.white),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //TOPIC ROW
                        Padding(
                            padding: const EdgeInsets.only(top: 30),
                            child: topicRow(context)),
                        //CATEGORY ROW
                        categoryRow(context),
                        Padding(
                            padding: const EdgeInsets.only(top: 60, left: 20),
                            child: const Text('Are you ready?')
                                .selectATopicTextStyle()),
                        const Padding(
                          padding: EdgeInsets.only(top: 40, left: 30),
                          child: Align(
                              alignment: Alignment.center,
                              child: GreenButton(name: 'START')),
                        ),
                      ]),
                ))));
  }
}
