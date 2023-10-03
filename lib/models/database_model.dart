class Categories {
  int? id;
  final String categoryName;

  Categories({this.id, required this.categoryName});

  //crea mapa a partir del objeto
  Map<String, dynamic> toMap() {
    return {
      'CategoryID': id,
      'CategoryName': categoryName,
    };
  }

  //crea un objeto a partir del mapa
  factory Categories.fromMap(Map<String, dynamic> map) {
    return Categories(
      id: map['CategoryID'],
      categoryName: map['CategoryName'],
    );
  }
}

class Questions {
  int? id;
  final String questionText;
  final int categoryID;

  Questions({
    this.id,
    required this.questionText,
    required this.categoryID,
  });

  //crea mapa a partir del objeto
  Map<String, dynamic> toMap() {
    return {
      'QuestionID': id,
      'QuestionText': questionText,
      'CategoryID': categoryID,
    };
  }

  //crea un objeto a partir del mapa
  factory Questions.fromMap(Map<String, dynamic> map) {
    return Questions(
      id: map['QuestionID'],
      questionText: map['QuestionText'],
      categoryID: map['CategoryID'],
    );
  }
}

class Answers {
  int? id;
  final String answerText;
  final int questionID;

  Answers({
    this.id,
    required this.answerText,
    required this.questionID,
  });

  //crea mapa a partir del objeto
  Map<String, dynamic> toMap() {
    return {
      'AnswerID': id,
      'AnswerText': answerText,
      'QuestionID': questionID,
    };
  }

  //crea un objeto a partir del mapa
  factory Answers.fromMap(Map<String, dynamic> map) {
    return Answers(
      id: map['AnswerID'],
      answerText: map['AnswerText'],
      questionID: map['QuestionID'],
    );
  }
}

class Rank {
  int? id;
  final int totalHits;
  final String date;
  final String topic;

  Rank(
      {this.id,
      required this.totalHits,
      required this.date,
      required this.topic});

  //crea mapa a partir del objeto
  Map<String, dynamic> toMap() {
    return {
      'RankID': id,
      'RankHits': totalHits,
      'RankDate': date,
      'Topic': topic,
    };
  }

  //crea un objeto a partir del mapa
  factory Rank.fromMap(Map<String, dynamic> map) {
    return Rank(
      id: map['RankID'],
      totalHits: map['RankHits'],
      date: map['RankDate'],
      topic: map['Topic'] ?? 'Topic',
    );
  }
}
