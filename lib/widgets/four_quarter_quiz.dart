import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:topeka/constants.dart';
import 'package:topeka/models/category.dart';
import 'package:topeka/models/quiz.dart';
import 'package:topeka/models/user.dart';
import 'package:topeka/widgets/header_quiz.dart';

class FourQuarterQuiz extends StatefulWidget {
  FourQuarterQuiz(this.category, this.step);

  final Category category;
  final int step;

  @override
  _FourQuarterQuizState createState() => _FourQuarterQuizState();
}

class _FourQuarterQuizState extends State<FourQuarterQuiz> {
  IconData fabIcon = Icons.check;
  Color? fabColor;
  int? answer;

  @override
  void initState() {
    super.initState();
    fabColor = widget.category.accentColor;
  }

  void clear() {
    setState(() {
      fabIcon = Icons.check;
      fabColor = widget.category.accentColor;
      answer = null;
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
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    color: answer == 0 ? widget.category.primaryColor : null,
                    child: ListTile(
                      title: Text(
                        quiz.options![0],
                        textAlign: TextAlign.center,
                        style: TextStyle(color: kTextDarkColor),
                      ),
                      onTap: () {
                        setState(() => answer = 0);
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: answer == 1 ? widget.category.primaryColor : null,
                    child: ListTile(
                      title: Text(
                        quiz.options![1],
                        textAlign: TextAlign.center,
                        style: TextStyle(color: kTextDarkColor),
                      ),
                      onTap: () {
                        setState(() => answer = 1);
                      },
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    color: answer == 2 ? widget.category.primaryColor : null,
                    child: ListTile(
                      title: Text(
                        quiz.options![2],
                        textAlign: TextAlign.center,
                        style: TextStyle(color: kTextDarkColor),
                      ),
                      onTap: () {
                        setState(() => answer = 2);
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: answer == 3 ? widget.category.primaryColor : null,
                    child: ListTile(
                      title: Text(
                        quiz.options![3],
                        textAlign: TextAlign.center,
                        style: TextStyle(color: kTextDarkColor),
                      ),
                      onTap: () {
                        setState(() => answer = 3);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        answer != null
            ? Positioned(
                top: 72,
                right: 16,
                child: FloatingActionButton(
                  child: Icon(fabIcon, color: Colors.black),
                  backgroundColor: fabColor,
                  onPressed: () async {
                    bool correct = quiz.answer.toString() == [answer].toString();
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
