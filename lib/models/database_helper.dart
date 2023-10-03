import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:testapp/models/database_model.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._();
  static Database? _database;

  DatabaseHelper._();

  Future<Database> get database async {
    _database ??= await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final String dbpath = await getDatabasesPath();
    final String path = join(dbpath, 'QuestionsTestApp.db');
    //Check if database exist
    final exists = await databaseExists(path);
    if (exists) {
      print('Database Available');
      return await openDatabase(path, readOnly: false);
    } else {
      print('Creating new copy');
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}
      //Copy from assets
      ByteData data =
          await rootBundle.load(join("assets", "db/QuestionsTestApp.db"));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      // Write and flush the bytes written
      await File(path).writeAsBytes(bytes, flush: true);
      print('Opening existing stored database');
      return await openDatabase(path, readOnly: false);
    }
  }

  Future<List<Questions>> getQuestions(String name, int index) async {
    final Database db = await instance.database;
    print('getQuestionsIndex: $index');
    getCategoryID(name) {
      print('getQuestionsName: $name');
      switch (name) {
        case 'Culture':
          {
            return '1';
          }
        case 'Sports':
          {
            return '2';
          }
        case 'Math\'s':
          {
            return '3';
          }
      }
    }

    print('getQuestionsCategoryID: ${getCategoryID(name)}');

    /// Retrieve a list of columns from Questions row with the specified getCategoryID[name].
    /// each map represents a single row
    final List<Map<String, dynamic>> getQuestions = await db.query(
      'Questions',
      columns: ['QuestionText', 'CategoryID'],
      where: 'CategoryID = ?',
      whereArgs: [getCategoryID(name)],
      limit: 1,
      offset: index,
    );
    print('getQuestionsquery: $getQuestions');
    return List.generate(getQuestions.length, (index) {
      final mapquestions = Questions.fromMap(getQuestions[index]);
      print('getQuestionsmap: $mapquestions');
      return Questions.fromMap(getQuestions[index]);
    });
  }

  Future<String> getAnswers(String question, int index) async {
    print(question);
    print(index);

    final List<Map<String, dynamic>> resultQuestionID = await _database!.query(
      'Questions',
      columns: ['QuestionID'],
      where: 'QuestionText = ?',
      whereArgs: [question],
    );
    print('resultQuestionID$resultQuestionID');
    final String questionID = resultQuestionID.first['QuestionID'].toString();

    final List<Map<String, dynamic>> resultAnswerText = await _database!.query(
      'Answers',
      columns: ['AnswerText'],
      where: 'QuestionID = ?',
      whereArgs: [questionID],
    );
    print('resultAnswer$resultAnswerText');
    if (resultAnswerText.isNotEmpty) {
      return resultAnswerText.first['AnswerText'] as String;
    } else {
      throw Exception('Answer not found');
    }
  }

  Future<int> insertRank(Rank rank) async {
    //return int as the rowID
    final Database db = await instance.database;
    //insert in the table Ranks the object type rankDatatoInsert
    return await db.insert('Ranks', rank.toMap());
  }

  Future<List<Rank>> getRank() async {
    final Database db = await instance.database;
    //for each element inside of the List<Maps, generamos un rank as object
    //it will add to the list and if there are 5 ranks the list will have and index 5
    final List<Map<String, dynamic>> maps = await db.query('Ranks');
    return List.generate(maps.length, (index) {
      return Rank.fromMap(maps[index]);
    });
  }
}
