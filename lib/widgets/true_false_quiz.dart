import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:topeka/constants.dart';
import 'package:topeka/models/category.dart';
import 'package:topeka/models/quiz.dart';
import 'package:topeka/models/user.dart';
import 'package:topeka/widgets/header_quiz.dart';

class TrueFalseQuiz extends StatefulWidget {
  TrueFalseQuiz(this.category, this.step);

  final Category category;
  final int step;

  @override
  _TrueFalseQuizState createState() => _TrueFalseQuizState();
}

class _TrueFalseQuizState extends State<TrueFalseQuiz> {
  IconData fabIcon = Icons.check;
  Color? fabColor;
  bool? answer;

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
                    color: answer == true ? kGreenColor : null,
                    child: ListTile(
                      title: Text(
                        'TRUE',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: kTextDarkColor),
                      ),
                      onTap: () {
                        setState(() => answer = true);
                      },
                    ),
                  ),
                ),
                SizedBox(width: 8.0),
                Expanded(
                  child: Container(
                    color: answer == false ? kRedColor : null,
                    child: ListTile(
                      title: Text(
                        'FALSE',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: kTextDarkColor),
                      ),
                      onTap: () {
                        setState(() => answer = false);
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
