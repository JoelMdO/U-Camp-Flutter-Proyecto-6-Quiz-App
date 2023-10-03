import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testapp/models/database_helper.dart';
import 'package:testapp/models/database_model.dart';
import 'package:testapp/models/provider/name_provider.dart';
import 'package:testapp/utils/colors.dart';
import 'package:testapp/utils/text_styles.dart';
import 'package:testapp/widgets/appbar/app_bar.dart';
import 'package:testapp/widgets/buttons/green_button.dart';

class RankPage extends StatefulWidget {
  final int totalHits;
  final String date;
  const RankPage({
    Key? key,
    required this.totalHits,
    required this.date,
  }) : super(key: key);

  @override
  State<RankPage> createState() => _RankState();
}

class _RankState extends State<RankPage> {
  final DatabaseHelper _databaseHelp = DatabaseHelper.instance;
  List<Rank> _rank = [];

  @override
  void initState() {
    super.initState();
    _addRank();
    _loadRanks();
  }

  Future<void> _addRank() async {
    final String name = Provider.of<NameProvider>(context, listen: false).name;
    final Rank newRank =
        Rank(totalHits: widget.totalHits, date: widget.date, topic: name);
    await _databaseHelp.insertRank(newRank);
    _loadRanks();
  }

  void _loadRanks() async {
    final rank = await _databaseHelp.getRank();
    setState(() {
      _rank = rank;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: PersonalAppBar(),
        body: SafeArea(
          top: true,
          left: true,
          bottom: true,
          right: true,
          child: Container(
            decoration: const BoxDecoration(color: Colors.white),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              //TOPIC ROW
              Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    children: [
                      Container(
                          width: screenWidth * 0.75,
                          height: 55,
                          decoration:
                              const BoxDecoration(color: Colores.greenDark),
                          child: Align(
                            alignment: AlignmentDirectional.topStart,
                            child: const Text(
                              'Rank',
                            ).topicTextStyle(),
                          )),
                      Container(
                        width: screenWidth * 0.25,
                        height: 55,
                        decoration: const BoxDecoration(color: Colores.white),
                      ),
                    ],
                  )),
              SizedBox(
                width: 800,
                height: 70,
                child: Stack(children: [
                  Positioned(
                      top: 40,
                      left: 30,
                      child: Container(
                          width: screenWidth * 0.75,
                          height: 20,
                          decoration:
                              const BoxDecoration(color: Colores.greenDark))),
                  Positioned(
                      left: 10,
                      child: Container(
                        width: screenWidth * 0.70,
                        height: 35,
                        decoration: const BoxDecoration(color: Colores.orange),
                      )),
                ]),
              ),

              ///LIST OF RANKINGS
              Padding(
                  padding: const EdgeInsets.only(top: 10, left: 20),
                  child: Row(children: [
                    Container(
                      height: screenHeight * 0.5,
                      width: screenWidth * 0.1,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(colors: [
                          Colores.orange,
                          Colores.cream,
                          Colores.white
                        ]),
                      ),
                    ),
                    SizedBox(
                        width: screenWidth * 0.8,
                        height: 300,
                        child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: _rank.length,
                            itemBuilder: (context, index) {
                              final rank = _rank[index];
                              print('Rank: ${rank.topic}');
                              return ListTile(
                                leading: Text(rank.id.toString()),
                                title:
                                    Text('Hits: ${rank.totalHits.toString()}')
                                        .hitsTextStyle(),
                                subtitle: Text('Date: ${rank.date}'),
                                trailing:
                                    Text('Topic: ${rank.topic.toString()}')
                                        .rankTopicTextStyle(),
                              );
                            }))
                  ])),
              const Padding(
                padding: EdgeInsets.only(top: 10),
                child: Center(child: GreenButton(name: 'RE-START')),
              ),
            ]),
          ),
        ));
  }
}
