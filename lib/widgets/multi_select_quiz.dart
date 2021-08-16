import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:topeka/constants.dart';
import 'package:topeka/models/category.dart';
import 'package:topeka/models/quiz.dart';
import 'package:topeka/models/user.dart';
import 'package:topeka/widgets/header_quiz.dart';

class MultiSelectQuiz extends StatefulWidget {
  MultiSelectQuiz(this.category, this.step, {this.translate = false});

  final Category category;
  final int step;
  final bool translate;

  @override
  _MultiSelectQuizState createState() => _MultiSelectQuizState();
}

class _MultiSelectQuizState extends State<MultiSelectQuiz> {
  IconData fabIcon = Icons.check;
  Color? fabColor;
  List<int> answer = [];

  @override
  void initState() {
    super.initState();
    fabColor = widget.category.accentColor;
  }

  void clear() {
    setState(() {
      fabIcon = Icons.check;
      fabColor = widget.category.accentColor;
      answer.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    Quiz quiz = widget.category.quizzes[widget.step];
    return Stack(
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            HeaderQuiz(widget.category, widget.step),
            Expanded(
              child: ListView.separated(
                itemCount: quiz.options!.length,
                separatorBuilder: (BuildContext context, int index) => Divider(height: 0.0),
                itemBuilder: (BuildContext context, int index) {
                  return CheckboxListTile(
                    title: Text(
                      widget.translate ? quiz.options![index].join(' <> ') : quiz.options![index],
                      style: TextStyle(color: kTextDarkColor),
                    ),
                    value: answer.contains(index),
                    activeColor: widget.category.accentColor,
                    checkColor: widget.category.backgroundColor,
                    onChanged: (value) {
                      if (value == true) {
                        setState(() => answer.add(index));
                      } else {
                        setState(() => answer.remove(index));
                      }
                    },
                  );
                },
              ),
            ),
          ],
        ),
        answer.isNotEmpty
            ? Positioned(
                top: 72,
                right: 16,
                child: FloatingActionButton(
                  child: Icon(fabIcon, color: Colors.black),
                  backgroundColor: fabColor,
                  onPressed: () async {
                    answer.sort();
                    bool correct = quiz.answer.toString() == answer.toString();
                    setState(() {
                      fabIcon = correct ? Icons.check : Icons.close;
                      fabColor = correct ? kGreenColor : kRedColor;
                    });
                    await Future.delayed(Duration(seconds: 1), () => clear());
                    context.read<UserData>().nextStep(widget.category.id, correct);
                  },
                ),
              )
            : Container(),
      ],
    );
  }
}
