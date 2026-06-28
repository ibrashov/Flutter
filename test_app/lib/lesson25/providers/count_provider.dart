import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {
  int _counter = 0;

  int get counter {
    return _counter;
  }

  void increase() {
    _counter++;
    notifyListeners();
  }

  void decrease() {
    _counter--;
    notifyListeners();
  }

  void reset() {
    _counter = 0;
    notifyListeners();
  }

  void addFive() {
    _counter = _counter + 5;
    notifyListeners();
  }
}