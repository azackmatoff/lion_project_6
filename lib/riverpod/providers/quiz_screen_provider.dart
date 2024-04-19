import 'package:flutter/material.dart';
import 'package:lion_project_6/common/constants/icons/app_icons.dart';
import 'package:lion_project_6/common/services/questions_service.dart';
import 'package:lion_project_6/riverpod/providers/quiz_screen_provider_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'quiz_screen_provider.g.dart';

@riverpod
class QuizScreenNotifier extends _$QuizScreenNotifier {
  @override
  QuizScreenProviderState build() => QuizScreenProviderState(icons: [], question: service.nextQuestion());

  bool checkAnswerAndOpenDialogIfNeeded({required bool userAnswer}) {
    _addIcon(userAnswer: userAnswer, correctAnswer: service.getAnswer());

    if (!service.isFinished()) {
      service.goToNext();
      return false;
    } else {
      return true;
    }
  }

  void _addIcon({
    required bool userAnswer,
    required bool correctAnswer,
  }) {
    if (userAnswer == correctAnswer) {
      state = QuizScreenProviderState(icons: _getIcons(true), question: service.nextQuestion());
    } else {
      state = QuizScreenProviderState(icons: _getIcons(false), question: service.nextQuestion());
    }
  }

  List<Widget> _getIcons(bool correct) {
    correct ? state.icons.add(AppIcons.correctIcon) : state.icons.add(AppIcons.falseIcon);
    return state.icons;
  }

  void _clear() {
    state = QuizScreenProviderState(icons: [], question: service.nextQuestion());
  }

  void restart() {
    service.restart();
    _clear();
  }
}
