import 'package:flutter/material.dart';

class CountProvider extends ChangeNotifier {
  static int count = 1;

  add() {
    count++;
    notifyListeners();
  }

  remove() {
    count--;
    notifyListeners();
  }

  reset() {
    count = 1;
    notifyListeners();
  }

  getCount() {
    return count;
  }
}
