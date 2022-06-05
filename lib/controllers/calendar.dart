import 'dart:math';

import 'package:flutter/material.dart';

class LoxCalendar {
  static const monthEndN = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
  static const monthEndL = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
  late int curYear, curMonth, curDay, offsetDay;
  late List<int> dates;

  LoxCalendar() {
    final today = DateTime.now();
    curYear = today.year;
    curMonth = today.month;
    curDay = today.day;
    dates = getCalendar();
  }

  List<int> getMonthEnd({int? year}) {
    bool isLeap = (year ?? curYear) % 4 == 0;
    return isLeap ? monthEndL : monthEndN;
  }

  List<int> getCalendar({int? year}) {
    List<int> dates = [];
    final b = getMonthEnd(year: year);
    for (int i = 0; i < b.length; i++) {
      for (int j = 1; j <= b[i]; j++) {
        dates.add(j);
      }
    }
    final start = DateTime(year ?? curYear);
    final end = DateTime(year ?? curYear);
    final startDay = start.weekday;
    final endDay = end.weekday;
    if (startDay != 1) {
      final difS = startDay - 1;
      offsetDay = difS;
      dates.insertAll(0, List.filled(difS, 0));
    }
    if (endDay != 7) {
      final difS = 7 - endDay;
      dates.addAll(List.filled(difS, 0));
    }
    return dates;
  }

  List<List<int>> getCalendarWeeks({int? year}) {
    List<int> dates = getCalendar(year: year);
    List<List<int>> weeks = [];
    for (int i = 0; i < dates.length; i += 7) {
      weeks.add(dates.sublist(i, i + 7));
    }
    return weeks;
  }

  int curWeek({int? day, int? month, int? year}) {
    int d = getCurIndex(day: day, month: month, year: year);
    return d ~/ 7;
  }

  int getCurDay(int i) {
    final b = i ~/ 7;
    return getCalendarWeeks()[b][i - (b * 7)];
  }

  int getCurIndex({int? day, int? month, int? year}) {
    int d = day ?? curDay;
    int m = month ?? curMonth;
    int y = year ?? curYear;
    return _getSumIndex(m, y % 4 == 0) + d + offsetDay - 1;
  }

  int _getSumIndex(int month, bool isLeap) {
    List<int> m = [];
    if (isLeap) {
      m = monthEndL.sublist(0, month - 1);
    } else {
      m = monthEndN.sublist(0, month - 1);
    }
    return _sumOfList(m);
  }

  int _sumOfList(List<int> a) {
    int sum = 0;
    for (int item in a) {
      sum += item;
    }
    return sum;
  }

  List<int> getWeek({int? a, int? b, int? c}) {
    final dates = getCalendar(year: c);
    int d = getCurIndex(day: a, month: b, year: c);
    int f = d - (d % 7);
    return dates.sublist(f, f + 7);
  }

  // int getCalIndex() {

  // }
}
