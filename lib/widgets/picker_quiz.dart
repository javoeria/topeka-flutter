import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:topeka/constants.dart';
import 'package:topeka/models/category.dart';
import 'package:topeka/models/quiz.dart';
import 'package:topeka/models/user.dart';
import 'package:topeka/widgets/header_quiz.dart';

class PickerQuiz extends StatefulWidget {
  PickerQuiz(this.category, this.step, {this.alpha = false});

  final Category category;
  final int step;
  final bool alpha;

  @override
  _PickerQuizState createState() => _PickerQuizState();
}

class _PickerQuizState extends State<PickerQuiz> {
  IconData fabIcon = Icons.check;
  Color fabColor;
  int answer;
  bool changed = false;

  @override
  void initState() {
    super.initState();
    fabColor = widget.category.accentColor;
    answer = widget.alpha ? 0 : widget.category.quizzes[widget.step].min;
  }

  void clear() {
    setState(() {
      fabIcon = Icons.check;
      fabColor = widget.category.accentColor;
      answer = null;
      changed = false;
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
            SizedBox(height: 16.0),
            Text(
              widget.alpha ? alphabet[answer] : (answer ?? quiz.min).toString(),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline1.copyWith(
                    color: kBasePrimaryColor,
                    fontWeight: FontWeight.normal,
                  ),
            ),
            Slider(
              value: (answer ?? quiz.min).toDouble(),
              min: widget.alpha ? 0 : quiz.min.toDouble(),
              max: widget.alpha ? 25 : quiz.max.toDouble(),
              divisions: quiz.step,
              activeColor: widget.category.accentColor,
              onChanged: (value) {
                setState(() {
                  answer = value.toInt();
                  changed = true;
                });
              },
            )
          ],
        ),
        changed
            ? Positioned(
                top: 72,
                right: 16,
                child: FloatingActionButton(
                  child: Icon(fabIcon, color: Colors.black),
                  backgroundColor: fabColor,
                  onPressed: () async {
                    dynamic value = widget.alpha ? alphabet[answer] : answer;
                    bool correct = quiz.answer.toString() == value.toString();
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
