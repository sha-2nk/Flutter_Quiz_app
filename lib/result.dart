// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

/* 
--> 'resultphrase' is treated as a functionreturn string
--> reset to the app is created by putting it below the resultphrase widget
--> ctrl+shift+R shortcut is used to refactor. To binding things in different
    widgets we can use this shortcut
-->   
*/

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetHandler;
  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    String resultText;
    if (resultScore <= 8) {
      resultText = 'You are Awesome and Incocent!';
    } else if (resultScore <= 12) {
      resultText = 'Pretty likeable!';
    } else if (resultScore <= 16) {
      resultText = 'You are ... strange?!';
    } else {
      resultText = 'You are so bad!';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        Text(
          resultPhrase,
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        TextButton(child: Text('Reset Quiz'), onPressed: resetHandler),
      ],
    ));
  }
}
