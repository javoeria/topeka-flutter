import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:topeka/constants.dart';
import 'package:topeka/models/category.dart';
import 'package:topeka/models/quiz.dart';
import 'package:topeka/models/user.dart';
import 'package:topeka/widgets/header_quiz.dart';

class SingleSelectQuiz extends StatefulWidget {
  SingleSelectQuiz(this.category, this.step);

  final Category category;
  final int step;

  @override
  _SingleSelectQuizState createState() => _SingleSelectQuizState();
}

class _SingleSelectQuizState extends State<SingleSelectQuiz> {
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
            Expanded(
              child: ListView.separated(
                itemCount: quiz.options!.length,
                separatorBuilder: (BuildContext context, int index) => Divider(height: 0.0),
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    color: answer == index ? widget.category.primaryColor : null,
                    child: ListTile(
                      title: Text(
                        alphabet[index] + '. ' + quiz.options![index],
                        style: TextStyle(color: kTextDarkColor),
                      ),
                      onTap: () {
                        setState(() => answer = index);
                      },
                    ),
                  );
                },
              ),
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
