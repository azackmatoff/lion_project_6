import 'dart:developer';

import 'package:lion_project_6/question.dart';

class QuestionsService {
  // 0. suroolordun indeksi
  int index = 0;

  // 1. Suroolordun tizmesi

  List<Question> questions = [
    Question(answer: false, question: 'KGnin borbor shaari Osh'), // 0
    Question(answer: true, question: 'Pengvinder kanattuularga kiret'), // 1
    Question(answer: false, question: 'Flutterdi Facebook jasagan'), // 2
    //3
  ];

  // 2. Kiyinki suroonu korsot

  String kiyinkiSuroonuKorsot() {
    log('kiyinkiSuroonuKorsot.index: $index');
    return questions[index].question;
  }

  // 3. Jooptu teksher

  // 4. kiyinki suroogo ot
  void kiyinkiSurooOt() {
    log('kiyinkiSurooOt.index murunku: $index');
    index++;
    log('kiyinkiSurooOt.index kiyinki: $index');
  }
}
