import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserData extends ChangeNotifier {
  UserData(this.prefs) {
    _points = prefs.getInt('points') ?? 0;
    _history = prefs.getStringList('history') ?? [];
  }

  final SharedPreferences prefs;

  late int _points;
  int get points => _points * 8;

  late List<String> _history;
  UnmodifiableListView<String> get history => UnmodifiableListView(_history);

  List<bool> categoryResults(String id) {
    String h = _history.firstWhere((e) => e.split('_')[0] == id, orElse: () => '${id}_');
    return h.split('_')[1].split('').map((e) => e == '1').toList();
  }

  void nextStep(String id, bool value) {
    if (value) {
      _points += 1;
      prefs.setInt('points', _points);
    }
    String h = _history.firstWhere((e) => e.split('_')[0] == id, orElse: () => '${id}_');
    if (h.split('_')[1].isNotEmpty) _history.remove(h);
    _history.add(h + (value ? '1' : '0'));
    prefs.setStringList('history', _history);
    notifyListeners();
  }

  void clear() {
    _points = 0;
    _history.clear();
    prefs.clear();
  }
}
