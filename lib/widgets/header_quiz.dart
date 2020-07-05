import 'package:flutter/material.dart';
import 'package:topeka/models/category.dart';

class HeaderQuiz extends StatelessWidget {
  HeaderQuiz(this.category, this.step);

  final Category category;
  final int step;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2.0,
      child: Container(
        height: 100.0,
        color: category.primaryColor,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              category.quizzes[step].question,
              style: TextStyle(color: category.textColor),
            ),
          ),
        ),
      ),
    );
  }
}
