// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, sized_box_for_whitespace, prefer_const_constructors

import 'package:flutter/material.dart';

/*
  --> As like in question.dart, things are defined under 'Container'
  --> ElevatedButton is define under 'child' of 'container'
  --> To change the style of buuton 'style' method is used 
    --> To change the color 'ElevatedButton.styleFrom' is used
*/

class Answer extends StatelessWidget {
  final VoidCallback
      selectHandler; // 'VoidCallback' is a void function. What is store in 'selectHander' is pointer to the VoidCallback function
  final String answerText;

  Answer(this.selectHandler, this.answerText); // 'Answer' constructor

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: selectHandler,
        child: Text(answerText),
        style: ElevatedButton.styleFrom(
            primary: Colors.pinkAccent, onPrimary: Colors.cyanAccent),
      ),
    );
  }
}
