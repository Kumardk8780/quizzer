import 'package:flutter/material.dart';
import './answer.dart';
import './question.dart';

class Quiz extends StatelessWidget {
  // const Quiz({super.key});

  Quiz(
      {required this.questions,
      required this.answerQuestion,
      required this.questionIndex});

  final answerQuestion;
  final int questionIndex;
  final List<Map<String, Object>> questions;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(questions[questionIndex]['questionText'] as String),
        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
            .map((answer) {
          return Answer(
              () => answerQuestion(answer['score']), answer['text'] as String);
        }).toList()
      ],
    );
  }
}
