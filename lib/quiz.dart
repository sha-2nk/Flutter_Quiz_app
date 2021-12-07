// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

/*
--> 3 variables are declared 'questions', 'answerQuestion', 'questionIndex' which is of differen types according to the values coming from main
*/

class Quiz extends StatelessWidget {
  final List questions;
  final int questionIndex;
  final Function answerQuestion;

  Quiz({
    // 'required' keyword is added here becuase the 3 given fields can't be null, if null then it will show error.
    required this.questions,
    required this.answerQuestion,
    required this.questionIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      // To load the couple of buttons we have to use 'Column' widget
      children: [
        Question(
          // 'questionText' will be print corresponding to '_questionIndex' from the List of 'questions'
          questions[questionIndex]['questionText'],
        ),
        ...(questions[questionIndex]['answers'] as List<Map>).map((answer) {
          return Answer(() => answerQuestion(answer['score']), answer['text']);
        }).toList()
      ],
    );
  }
}
