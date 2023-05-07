import 'package:flutter/material.dart';
import 'package:quizzer/result.dart';
import './quiz.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _questions = [
    {
      'questionText': 'What is your favourite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 8},
        {'text': 'Green', 'score': 5},
        {'text': 'Blue', 'score': 9},
      ],
    },
    {
      'questionText': 'What is your favourite animal?',
      'answers': [
        {'text': 'Lion', 'score': 3},
        {'text': 'Giraffe', 'score': 11},
        {'text': 'Elephant', 'score': 5},
        {'text': 'Tiger', 'score': 9},
      ],
    },
    {
      'questionText': 'Who is your favourite person',
      'answers': [
        {'text': 'Sachin', 'score': 1},
        {'text': 'Dhoni', 'score': 1},
        {'text': 'Viru', 'score': 1},
        {'text': 'Kohli', 'score': 1}
      ],
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('No more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
