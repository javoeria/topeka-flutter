import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:topeka/constants.dart';
import 'package:topeka/models/category.dart';
import 'package:topeka/models/quiz.dart';
import 'package:topeka/models/user.dart';
import 'package:topeka/widgets/fill_blank_quiz.dart';
import 'package:topeka/widgets/four_quarter_quiz.dart';
import 'package:topeka/widgets/multi_select_quiz.dart';
import 'package:topeka/widgets/picker_quiz.dart';
import 'package:topeka/widgets/single_select_quiz.dart';
import 'package:topeka/widgets/true_false_quiz.dart';

class QuizScreen extends StatelessWidget {
  QuizScreen({
    required this.category,
    required this.avatar,
  });

  final Category category;
  final int avatar;

  Widget showQuiz(String type, int step) {
    switch (type) {
      case 'alpha-picker':
        return PickerQuiz(category, step, alpha: true);
        break;
      case 'fill-blank':
        return FillBlankQuiz(category, step);
        break;
      case 'fill-two-blanks':
        return FillBlankQuiz(category, step, two: true);
        break;
      case 'four-quarter':
        return FourQuarterQuiz(category, step);
        break;
      case 'multi-select':
        return MultiSelectQuiz(category, step);
        break;
      case 'picker':
        return PickerQuiz(category, step);
        break;
      case 'single-select':
      case 'single-select-item':
        return SingleSelectQuiz(category, step);
        break;
      case 'toggle-translate':
        return MultiSelectQuiz(category, step, translate: true);
        break;
      case 'true-false':
        return TrueFalseQuiz(category, step);
        break;
      default:
        return Text(type);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    List<bool> results = context.watch<UserData>().categoryResults(category.id);
    int step = results.length;
    Quiz quiz = category.quizzes[step % 10];
    return Scaffold(
      backgroundColor: category.backgroundColor,
      appBar: AppBar(
        title: Text(
          category.name,
          style: TextStyle(color: category.textColor),
        ),
        leading: BackButton(color: category.textColor),
        backgroundColor: category.primaryColor,
        elevation: 0.0,
      ),
      body: step == 10 ? ResultList(category, results) : showQuiz(quiz.type, step),
      bottomNavigationBar: Container(
        color: category.primaryColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                height: 4.0,
                child: LinearProgressIndicator(
                  backgroundColor: category.primaryDarkColor,
                  valueColor: AlwaysStoppedAnimation<Color>(category.accentColor),
                  value: step / 10,
                ),
              ),
              SizedBox(height: 8.0),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: AssetImage('images/avatars/avatar_${avatar}_raster.png'),
                  ),
                  SizedBox(width: 16.0),
                  Text('$step / 10', style: TextStyle(color: category.textColor)),
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
              answer = quiz.answer.map((a) => quiz.options![a].join(' <> ')).join('\n');
            } else {
              answer = quiz.answer.map((a) => quiz.options![a]).join('\n');
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
