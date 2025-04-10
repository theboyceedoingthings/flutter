import 'package:flutter/material.dart';

class CounterProvider with ChangeNotifier {
  int count = 10;

  int get getCount => count;

  void increment() {
    if (count > 0) {
      count--;
    }
    notifyListeners();
  }
}
