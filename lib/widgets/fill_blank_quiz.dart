import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:topeka/constants.dart';
import 'package:topeka/models/category.dart';
import 'package:topeka/models/quiz.dart';
import 'package:topeka/models/user.dart';
import 'package:topeka/widgets/header_quiz.dart';

class FillBlankQuiz extends StatefulWidget {
  FillBlankQuiz(this.category, this.step, {this.two = false});

  final Category category;
  final int step;
  final bool two;

  @override
  _FillBlankQuizState createState() => _FillBlankQuizState();
}

class _FillBlankQuizState extends State<FillBlankQuiz> {
  IconData fabIcon = Icons.check;
  Color fabColor;
  String answer = '';
  String answer2 = '';

  @override
  void initState() {
    super.initState();
    fabColor = widget.category.accentColor;
  }

  void clear() {
    setState(() {
      fabIcon = Icons.check;
      fabColor = widget.category.accentColor;
      answer = '';
      answer2 = '';
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
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  quiz.start != null
                      ? Text(quiz.start, style: TextStyle(color: kTextDarkColor))
                      : Container(),
                  TextField(
                    cursorColor: widget.category.accentColor,
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: widget.category.accentColor),
                      ),
                    ),
                    textCapitalization: TextCapitalization.words,
                    onChanged: (value) {
                      setState(() => answer = value);
                    },
                  ),
                  widget.two
                      ? TextField(
                          cursorColor: widget.category.accentColor,
                          decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: widget.category.accentColor),
                            ),
                          ),
                          textCapitalization: TextCapitalization.words,
                          onChanged: (value) {
                            setState(() => answer2 = value);
                          },
                        )
                      : Container(),
                  quiz.end != null
                      ? Text(quiz.end, style: TextStyle(color: kTextDarkColor))
                      : Container(),
                ],
              ),
            ),
          ],
        ),
        answer.isNotEmpty || answer2.isNotEmpty
            ? Positioned(
                top: 72,
                right: 16,
                child: FloatingActionButton(
                  child: Icon(fabIcon, color: Colors.black),
                  backgroundColor: fabColor,
                  onPressed: () async {
                    dynamic value = widget.two ? [answer, answer2] : answer;
                    bool correct =
                        quiz.answer.toString().toLowerCase() == value.toString().toLowerCase();
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
