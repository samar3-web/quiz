import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());
class MyApp extends StatefulWidget {
  
  @override 
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}


class _MyAppState extends State<MyApp> { 
  var _questionIndex = 0;
  var _totalScore = 0;

    static const _questions = const [
      {
        'questionText': 'What is your favourite color?', 
        'answers': [
          {'text': 'Black', 'score': 10}, 
          {'text': 'Red', 'score': 5}, 
          {'text': 'Blue', 'score': 3}, 
          {'text': 'White', 'score': 1}
        ],
      }, 
      {
        'questionText': 'What is your favourite animal?',
        'answers': [{'text': 'Rabbit', 'score': 3}, 
          {'text': 'Dog', 'score': 5}, 
          {'text': 'Cat', 'score': 7}, 
          {'text': 'Parrot', 'score': 1}
        ],
      },
      {
        'questionText': 'What is your favourite food?',
        'answers': [{'text': 'Burger', 'score': 9}, 
          {'text': 'Pizza', 'score': 5}, 
          {'text': 'Noodles', 'score': 3}, 
          {'text': 'Pasta', 'score': 1}
        ],
      },
    ];

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

    print(_questionIndex);

    if(_questionIndex < _questions.length) {
      print("We have more questions!");
    } else {
      print('No more questions!');
    }
  }

  @override 
  Widget build(BuildContext context) { 
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quiz Sample'),
        ),
        body: _questionIndex < _questions.length 
          ? 
             Quiz(
               answerQuestion: _answerQuestion, 
               questionIndex: _questionIndex, 
               questions: _questions,
              )
          : 
            Result(_totalScore, _resetQuiz)
      ),
    ); 
  }
} 
