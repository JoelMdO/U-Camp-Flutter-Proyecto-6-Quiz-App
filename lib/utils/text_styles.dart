import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testapp/utils/colors.dart';

extension TestTitleStyle on Text {
  Text testTitleStyle() {
    return Text(data!,
        style: GoogleFonts.kanit(color: Colores.white, fontSize: 103));
  }
}

extension YourTextStyle on Text {
  Text yourTextStyle() {
    return Text(data!,
        style: GoogleFonts.kaushanScript(color: Colors.black, fontSize: 58));
  }
}

extension SelfTextStyle on Text {
  Text selfTextStyle() {
    return Text(data!,
        style: GoogleFonts.kanit(color: Colores.white, fontSize: 58));
  }
}

extension SelectATopicTextStyle on Text {
  Text selectATopicTextStyle() {
    return Text(data!,
        style: GoogleFonts.lacquer(color: Colors.black, fontSize: 25));
  }
}

extension GreenButtonTextStyle on Text {
  Text greenButtonTextStyle() {
    return Text(data!,
        style: GoogleFonts.luckiestGuy(color: Colors.black, fontSize: 18));
  }
}

extension TopicTextStyle on Text {
  Text topicTextStyle() {
    return Text(data!,
        style: GoogleFonts.kanit(color: Colores.white, fontSize: 40));
  }
}

extension NameTextStyle on Text {
  Text nameTextStyle() {
    return Text(data!,
        style: GoogleFonts.kaushanScript(color: Colors.black, fontSize: 52));
  }
}

extension QuestionTextStyle on Text {
  Text questionTextStyle() {
    return Text(data!,
        style: GoogleFonts.kanit(color: Colors.black, fontSize: 14));
  }
}

extension OrangeButtonTextStyle on Text {
  Text orangeButtonTextStyle() {
    return Text(data!,
        style: GoogleFonts.luckiestGuy(
            color: Colores.cream, fontSize: 15, letterSpacing: 5));
  }
}

extension OrangeButtonTextStrokeStyle on Text {
  Text orangeButtonTextStrokeStyle() {
    return Text(data!,
        style: GoogleFonts.luckiestGuy(
            fontSize: 15,
            letterSpacing: 5,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 3
              ..color = Colors.black));
  }
}

extension AnswerButtonTextStyle on Text {
  Text answerButtonTextStyle() {
    return Text(data!,
        style: GoogleFonts.kanit(
          color: Colores.blue,
          fontSize: 16,
          fontStyle: FontStyle.italic,
        ));
  }
}

extension NextButtonTextStyle on Text {
  Text nextButtonTextStyle() {
    return Text(data!,
        style: GoogleFonts.kanit(
          fontSize: 10,
          fontStyle: FontStyle.italic,
          color: Colores.white,
        ));
  }
}

extension AnswerFinalTextStyle on Text {
  Text answerFinalTextStyle() {
    return Text(data!,
        style: GoogleFonts.kanit(
          color: Colors.black,
          fontSize: 20,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.normal,
        ));
  }
}

extension AnswerFinalNumberTextStyle on Text {
  Text answerFinalNumberTextStyle() {
    return Text(data!,
        style: GoogleFonts.kanit(
          color: Colors.black,
          fontSize: 18,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.normal,
        ));
  }
}

extension HitsTextStyle on Text {
  Text hitsTextStyle() {
    return Text(data!,
        style: GoogleFonts.kanit(
          fontSize: 10,
          fontStyle: FontStyle.normal,
          color: Colors.black,
        ));
  }
}

extension RankTopicTextStyle on Text {
  Text rankTopicTextStyle() {
    return Text(data!,
        style:
            GoogleFonts.kaushanScript(color: Colores.greenDark, fontSize: 10));
  }
}
