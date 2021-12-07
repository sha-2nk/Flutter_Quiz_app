// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

/*
  --> by adding 'final', 'questionText' value will never change after its initialization in the constructor
  -->Designinig of questionText output
    --> It is advisable to wrap the Text output in the 'Container' 
    --> Now assign the 'Text' as a 'child' of 'Container' 
    --> 'width: double.infinity' under 'Container' ensures that conatiner takes
         as much width as it can get, so by default the full width of the device
    --> 'margin' under 'Container' ensures the margin around the Text, EdgeInsets.all(..) ensures edge from all sides
    --> 'style: TextStyle()' is used to change the style of text (ctrl+space to see diff options) 
    --> Under 'Textsyle' we are changing the font size
    --> 'textAlign' cares for the alignment of the text (here it brings to the center)
*/

class Question extends StatelessWidget {
  final String questiontext;

  Question(this.questiontext); // 'Question' class constructor

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: Text(
        questiontext,
        style: TextStyle(fontSize: 22),
        textAlign: TextAlign.center,
      ),
    );
  }
}
