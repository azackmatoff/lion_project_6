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

    bool tuuraJoop = service.tuuraJooptuBer();

    if (koldonuuchununJoobu == tuuraJoop) {
      icons.add(correctIcon);
    } else {
      icons.add(falseIcon);
    }

    bool buttu = service.suroolorButtu();

    if (buttu == false) {
      service.kiyinkiSurooOt();
    } else {
      openDialog();
    }

    setState(() {});
  }

  void openDialog() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Finished!'),
        content: Text('You\'ve reached the end of the quiz.'),
        actions: <Widget>[
          TextButton(
            child: Text('Restart'),
            onPressed: () {
              service.kayradanBashta();
              // icons.clear();
              icons = [];
              Navigator.of(ctx).pop();

              setState(() {});
            },
          ),
        ],
      ),
    );
  }
}
