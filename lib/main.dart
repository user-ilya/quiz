import 'package:flutter/material.dart';
import 'package:flutter_application_1/question.dart';
import 'answer.dart';

void main () {
  runApp(MyApp());
}


class MyApp extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _index =  0;
  num _result = 0;

  
  void _answerQuestion (num score) {
    setState(() => {
       _index++,
       _result+=score
    });  
  }


  @override
  Widget build(BuildContext context) {

    var questions = [
      {
        'question': 'What is your favourite color ?',
        'answer': [
          {'text':'black', 'score': 5}, 
          {'text':'green', 'score': 15},
          {'text':'red', 'score': 10},
          {'text':'yellow', 'score': 0},],
      },
      {
        'question': 'What is your favourite car ?',
        'answer': [
          {'text': 'Skoda', 'score': 20},
          {'text': 'Volvo', 'score': 10},
          {'text': 'BMW', 'score': 15}, 
        ],
      },
      {
        'question': 'What is your like animal ?',
        'answer': [
          {'text': 'cat', 'score': 10},
          {'text': 'dog', 'score': 15},
          {'text': 'kit', 'score': 0},
          {'text': 'lion', 'score': 5},
        ],
      },
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
           title: const Text('Home Page')
        ),
        body: _index < questions.length ? Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Question(questions[_index]['question'] as String),
            ...(questions[_index]['answer'] as List<Map<String,Object>>).map((answer) {
              answer['text'] = answer['text'].toString().toUpperCase();
              return Answer(() => _answerQuestion(answer['score'] as num), answer['text'].toString());
            }).toList(),
          ],
        ) : Column(children: [
          Center(child: CircularProgressIndicator(),),
          Text('Вопросы закончились'),
          Text('Ваш результат: $_result'),
        ],)
      ),
    );
  }
} 