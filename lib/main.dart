// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, avoid_print

import 'package:flutter/material.dart';

import './quiz.dart'; //import custom widget from the same lib folder
import './result.dart';

void main() {
  runApp(MyApp());
}

//----------------------This app is made with Statelesswidget which will not help in moving to other question---------------//

/*
-->  List of questions is declare 
-->  To load the couple of buttons we have to use 'Column' widget 
-->  If we wnat items next to each other (instead of above each other), we have to use 'Row' widget )
-->  Column has 'children' as argument which takes list of widgets 
-->  '[]' is used for lists like any other language (list of any thing can be created like strings, int, chars etc)
-->  '<widget>' tells that list should be of widgets (we can also drop this as dart can automatically detect by the arguments inside [])
  
  * 'RaisedButton' is not supported now so here we used 'ElevatedButton'

-->  'Elevatedbutton' has 'child' which has the content inside the button (it could be image, icon, text anything)
-->  Buttons also have 'onPressed' argument which will executed when the button will pressed
-->  onPressed requies a pointer fuction (e.g. answerQuestion without () in 'option 1') which will execute on pressing it
  Tip: function of onPress should be inside the class where the onpress is, so that the whole class works standalone
-->  we can also define function for onPress without declaring it before unlike answerQuestion()
     ---> we have done this in option 2 3 4
*/

/*class MyApp extends StatelessWidget {
  var questionIndex = 0;

  void answerQuestion() {
    questionIndex = questionIndex + 1;
    print(questionIndex);
  }

  @override // it's just a decorator
  Widget build(BuildContext context) {
    const questions = [
      'What\'s your favourite colour?',
      'What\'s your favourite Movie?'
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quiz App'),
        ),
        body: Column(
          // To load the couple of buttons we have to use 'Column' widget
          children: [
            Text(questions[
                questionIndex]), // questions.elementAt[..] is also valid
            ElevatedButton(
              onPressed: answerQuestion,
              child: Text('Option 1'),
            ),
            ElevatedButton(
              onPressed: () => print('Option 2 Choosen'),
              child: Text('Option 2'),
            ),
            ElevatedButton(
              onPressed: () {
                //....here we can also add some stuff
                print('Option 3 Choosen');
              },
              child: Text('Option 3'),
            ),
            ElevatedButton(
              onPressed: () => print('Option 4 Choosen'),
              child: Text('Option 4'),
            ),
          ],
        ),
      ),
    );
  }
}*/

//----------------------This app is made with Statefulwidget which will help in moving to other question---------------//

/*
  --> Here we are going to make StatefulWidget step by step without taking the advantage of key binding ctrl+shift+R 
  --> Stateful  widget is used when we have to react give some output
  --> StatefulWidget has 2 class which needs to be connected to each other
    --> 1st class is returning the MyApp by 'MyAppSate' (studd inside 1st class need to be remembered)
    --> In 2nd class 'MyAppState' is extends instead of MyApp, to the State of MyApp
  --> For the next question, questionIndex is incremented in setState of answerQuestion function 
  --> setState contains anonymous function. setState always comes with Stat
  --> When we call setState it class Build evry time
  --> _ before MyAppState turn it to private class instead of public, so now MyAppState accessible only where it is defined i.e, main.dart 
  --> _ before questionIndex makes it also private which can be accessible only in that class where it is defined
  --> _ before answerQuestion() also makes it private 
  --> By adding _ we ensure that MyAppState and all the properties in there can't be used from anywhere else
  --> Here we have used 'Question' widget instead of 'Text'. Question widget is created in 'question.dart' file
    --> Question widget is useful here as if we want to change the structure of question appearance we just have to do changes in that 
        particular Question class not in the 'main.dart' file.  
  -->  Dart is unable to understand that 'questions[_questionIndex]['answers']' so we instruct it that it is a 'List<String>'
  --> 'questions[_questionIndex]['answers']' is map into a function 'answer' which will return the options 
  --> '_questionIndex < _questions.length ?' this line worked as if statement i.e, the whole 'Quiz()' widget will run if the condition will satisfy
  --> Assigning the values to the 3 variables of 'quiz.dart' inside the 'Quiz()' widget
  --> After the 'Quiz()' widget ends ':' is used as else condition which takes the widget, here Seperate 'Result()' widget is created for that
  --> To reset the Quiz, 'resetQuiz' function is defined. 'setState' is used here because we have to re-trigger 'Build' again to reset the Quiz
*/

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // ignore: todo
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
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
    print(_questionIndex);
  }

  @override // it's just a decorator
  Widget build(BuildContext context) {
    List _questions = [
      // '{}' is used for Map. For 3 questions we had used 3 '{}'. One map contains question and options in it.
      // For question, 'questionText' is the key and question statement is the object
      // For answer, 'answers' is the key and list of options is the object
      {
        'questionText': 'What\'s your favorite color?',
        'answers': [
          {'text': 'Black', 'score': 10},
          {'text': 'Red', 'score': 5},
          {'text': 'White', 'score': 3},
          {'text': 'Green', 'score': 2}
        ],
      },
      {
        'questionText': 'What\'s your favorite animal?',
        'answers': [
          {'text': 'Rabbit', 'score': 5},
          {'text': 'Snake', 'score': 3},
          {'text': 'Elephant', 'score': 10},
          {'text': 'Lion', 'score': 2}
        ],
      },
      {
        'questionText': 'Who\'s your favorite instructor?',
        'answers': [
          {'text': 'Katherene', 'score': 5},
          {'text': 'Williams', 'score': 10},
          {'text': 'Abraham', 'score': 2},
          {'text': 'Jennifer', 'score': 3}
        ],
      },
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quiz App'),
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
