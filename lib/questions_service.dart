import 'dart:developer';

import 'package:lion_project_6/question.dart';

class QuestionsService {
  // 0. suroolordun indeksi
  int index = 0;

  // 1. Suroolordun tizmesi

  List<Question> questions = [
    Question(answer: false, question: 'KGnin borbor shaari Osh'), // 0
    Question(answer: true, question: 'Pingvinder kanattuularga kiret'), // 1
    Question(answer: false, question: 'Flutterdi Facebook jasagan'), // 2
    Question(answer: true, question: 'KGdin 90%ti too'), // 3
    //4
  ];

  // 2. Kiyinki suroonu korsot

  String kiyinkiSuroonuKorsot() {
    // log('kiyinkiSuroonuKorsot.index: $index');
    return questions[index].question;
  }

  // 3. Jooptu teksher

  // 4. kiyinki suroogo ot
  void kiyinkiSurooOt() {
    // log('kiyinkiSurooOt.index questions.length: ${questions.length}');
    // log('kiyinkiSurooOt.index murunku: $index');

    if (index < questions.length - 1) {
      index++;
    }

    // log('kiyinkiSurooOt.index kiyinki: $index');
  }

// 5. tuura jooptu alip kel
  bool tuuraJooptuBer() {
    return questions[index].answer;
  }

// 6. suroolor buttubu teksher
  bool suroolorButtu() {
    return questions.length - 1 == index;
  }

  // 7. kayradan bashta
  void kayradanBashta() {
    index = 0;
  }
}
