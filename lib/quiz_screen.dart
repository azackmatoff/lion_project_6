import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:lion_project_6/questions_service.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  Widget correctIcon = const Icon(Icons.check, color: Colors.green);
  Widget falseIcon = const Icon(Icons.close, color: Colors.red);

  List<Widget> icons = [];

  QuestionsService service = QuestionsService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Center(
                    child: Text(
                      service.kiyinkiSuroonuKorsot(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 25.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.green),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                      ),
                    ),
                    child: const Text(
                      'True',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                    onPressed: () {
                      jooptuTeksher(koldonuuchununJoobu: true);
                    },
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                      ),
                    ),
                    child: const Text(
                      'False',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      jooptuTeksher(koldonuuchununJoobu: false);
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  children: icons,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void jooptuTeksher({required bool koldonuuchununJoobu}) {
    /// DRY - Don't Repeat Yourself
    /// KISS - Keep It Simple Stupid

    bool buttu = service.suroolorButtu();
    print('buttu: $buttu');

    if (buttu == false) {
      //// ikonka kosh bashtalishi
      // print('koldonuuchununJoobu: $koldonuuchununJoobu');
      bool tuuraJoop = service.tuuraJooptuBer();

      // print('tuuraJoop: $tuuraJoop');
      if (koldonuuchununJoobu == tuuraJoop) {
        icons.add(correctIcon);
      } else {
        icons.add(falseIcon);
      }

      //// ikonka kosh butushu

      service.kiyinkiSurooOt();

      setState(() {});
    }
  }
}
