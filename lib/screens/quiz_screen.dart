import 'package:flutter/material.dart';
import 'package:topeka/constants.dart';
import 'package:topeka/models/category.dart';
import 'package:topeka/models/quiz.dart';
import 'package:topeka/widgets/fill_blank_quiz.dart';
import 'package:topeka/widgets/four_quarter_quiz.dart';
import 'package:topeka/widgets/multi_select_quiz.dart';
import 'package:topeka/widgets/picker_quiz.dart';
import 'package:topeka/widgets/single_select_quiz.dart';
import 'package:topeka/widgets/true_false_quiz.dart';

class QuizScreen extends StatefulWidget {
  QuizScreen({
    @required this.category,
    @required this.avatar,
  });

  final Category category;
  final int avatar;

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  Quiz quiz;
  int step = 0;
  List<bool> results = [];

  @override
  void initState() {
    super.initState();
    quiz = widget.category.quizzes[0];
  }

  void nextStep(bool value) {
    results.add(value);
    setState(() {
      step += 1;
      quiz = widget.category.quizzes[step % 10];
    });
  }

  Widget showQuiz() {
    switch (quiz.type) {
      case 'alpha-picker':
        return PickerQuiz(widget.category, step, nextStep, alpha: true);
        break;
      case 'fill-blank':
        return FillBlankQuiz(widget.category, step, nextStep);
        break;
      case 'fill-two-blanks':
        return FillBlankQuiz(widget.category, step, nextStep, two: true);
        break;
      case 'four-quarter':
        return FourQuarterQuiz(widget.category, step, nextStep);
        break;
      case 'multi-select':
        return MultiSelectQuiz(widget.category, step, nextStep);
        break;
      case 'picker':
        return PickerQuiz(widget.category, step, nextStep);
        break;
      case 'single-select':
      case 'single-select-item':
        return SingleSelectQuiz(widget.category, step, nextStep);
        break;
      case 'toggle-translate':
        return MultiSelectQuiz(widget.category, step, nextStep, translate: true);
        break;
      case 'true-false':
        return TrueFalseQuiz(widget.category, step, nextStep);
        break;
      default:
        return Text(quiz.type);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.category.backgroundColor,
      appBar: AppBar(
        title: Text(
          widget.category.name,
          style: TextStyle(color: widget.category.textColor),
        ),
        leading: BackButton(color: widget.category.textColor),
        backgroundColor: widget.category.primaryColor,
        elevation: 0.0,
      ),
      body: step == 10 ? ResultList(widget.category, results) : showQuiz(),
      bottomNavigationBar: Container(
        color: widget.category.primaryColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                height: 4.0,
                child: LinearProgressIndicator(
                  backgroundColor: widget.category.primaryDarkColor,
                  valueColor: AlwaysStoppedAnimation<Color>(widget.category.accentColor),
                  value: step / 10,
                ),
              ),
              SizedBox(height: 8.0),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage:
                        AssetImage('images/avatars/avatar_${widget.avatar}_raster.png'),
                  ),
                  SizedBox(width: 16.0),
                  Text('$step / 10', style: TextStyle(color: widget.category.textColor)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ResultList extends StatelessWidget {
  ResultList(this.category, this.results);

  final Category category;
  final List<bool> results;

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: ListView.separated(
        itemCount: 10,
        separatorBuilder: (BuildContext context, int index) => Divider(height: 0.0),
        itemBuilder: (BuildContext context, int index) {
          Quiz quiz = category.quizzes[index];
          String answer = quiz.answer.toString();
          if (quiz.answer is List) {
            if (quiz.type == 'fill-two-blanks') {
              answer = quiz.answer.join('\n');
            } else if (quiz.type == 'toggle-translate') {
              answer = quiz.answer.map((a) => quiz.options[a].join(' <> ')).join('\n');
            } else {
              answer = quiz.answer.map((a) => quiz.options[a]).join('\n');
            }
          }

          return ListTile(
            leading: results[index] == true
                ? Icon(Icons.check, color: kGreenColor)
                : Icon(Icons.close, color: kRedColor),
            title: Text(quiz.question, style: TextStyle(color: kTextDarkColor)),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(answer, style: TextStyle(color: kTextDarkColor)),
            ),
          );
        },
      ),
    );
  }
}
