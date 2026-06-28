import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  bool _isDarkMode = false;

  bool get isDarkMode {
    return _isDarkMode;
  }

  ThemeMode get themeMode {
    return _isDarkMode ? ThemeMode.dark : ThemeMode.light;
  }

  void toggleTheme(bool value) {
    _isDarkMode = value;
    notifyListeners();
  }
}