import 'package:flutter/material.dart';

class Quiz {
  Quiz({
    @required this.type,
    @required this.question,
    this.options,
    this.min,
    this.max,
    this.step,
    this.start,
    this.end,
    @required this.answer,
  });

  final String type;
  final String question;
  final List<dynamic> options;
  final int min;
  final int max;
  final int step;
  final String start;
  final String end;
  final dynamic answer;
}
