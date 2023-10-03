import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testapp/models/database_helper.dart';
import 'package:testapp/models/database_model.dart';
import 'package:testapp/models/provider/index_provider.dart';
import 'package:testapp/models/provider/name_provider.dart';
import 'package:testapp/utils/colors.dart';
import 'package:testapp/utils/text_styles.dart';
import 'package:testapp/widgets/appbar/app_bar.dart';
import 'package:testapp/widgets/buttons/green_button.dart';
import 'package:testapp/widgets/buttons/true_false_button.dart';
import 'package:testapp/widgets/rows_pages/category_page_row.dart';
import 'package:testapp/widgets/rows_pages/topic_page_row.dart';

class TestPage extends StatefulWidget {
  const TestPage({
    super.key,
  });

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  int index = 0;
  final DatabaseHelper _databaseHelper = DatabaseHelper.instance;
  String questionText = '';

  @override
  Widget build(BuildContext context) {
    final String name = Provider.of<NameProvider>(context).name;
    final int index = Provider.of<IndexProvider>(context).index;
    return Scaffold(
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

                      ///ARE YOU READY
                      Padding(
                          padding: const EdgeInsets.only(top: 60, left: 20),
                          child: Text('Question: ${index + 1}/9')
                              .questionTextStyle()),
                      FutureBuilder<List<Questions>>(
                          future: _databaseHelper.getQuestions(name, index),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            } else if (snapshot.hasError) {
                              return Text('Error: ${snapshot.error}');
                            } else if (!snapshot.hasData ||
                                snapshot.data!.isEmpty) {
                              return const Text(
                                  'No items found for this category.');
                            } else {
                              final questionText =
                                  snapshot.data![0].questionText;
                              return Stack(
                                  alignment: AlignmentDirectional.topStart,
                                  children: [
                                    Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10, left: 25),
                                        child: Text(questionText)
                                            .questionTextStyle()),
                                    Padding(
                                        padding: const EdgeInsets.only(top: 50),
                                        child: SizedBox(
                                          width: 800,
                                          height: 100,
                                          child: Stack(children: [
                                            const Positioned(
                                              top: 17,
                                              left: 75,
                                              child: CircleAvatar(
                                                radius: 15,
                                                backgroundColor:
                                                    Colores.greenDark,
                                              ),
                                            ),
                                            Positioned(
                                              top: 5,
                                              left: 90,
                                              child: TrueFalseButton(
                                                type: 'TRUE',
                                                index: index,
                                                name: name,
                                                question: questionText,
                                              ),
                                            ),
                                            const Positioned(
                                                top: 17,
                                                right: 75,
                                                child: CircleAvatar(
                                                  radius: 15,
                                                  backgroundColor:
                                                      Colores.greenDark,
                                                )),
                                            Positioned(
                                                top: 5,
                                                right: 90,
                                                child: TrueFalseButton(
                                                  type: 'FALSE',
                                                  index: index,
                                                  name: name,
                                                  question: questionText,
                                                )),
                                          ]),
                                        )),
                                    const Padding(
                                      padding:
                                          EdgeInsets.only(top: 150, left: 150),
                                      child: Align(
                                          alignment: Alignment.center,
                                          child: GreenButton(name: 'RE-START')),
                                    ),
                                  ]);
                            }
                          })
                    ]))));
  }
}
