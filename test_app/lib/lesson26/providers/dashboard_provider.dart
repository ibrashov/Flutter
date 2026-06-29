import 'package:flutter/material.dart';
class DashboardProvider extends ChangeNotifier {
  int _counter = 0;
  String _username = 'Anuar';
  bool _isPremium = false;
  int get counter{
    return _counter;
  }
  String get username{
    return _username;
  }
  bool get isPremium{
    return _isPremium;
  }
  void increase(){
    _counter++;
    notifyListeners();
  }
  void decrease(){
    _counter--;
    notifyListeners();
  }
  void reset(){
    _counter = 0;
    notifyListeners();
  }
  void changeUserName(String name){
    final cleanName = name.trim();
    if(cleanName.isEmpty){
      return;
    }
    _username = cleanName;
    notifyListeners();
  }
  void togglePremium(bool value){
      _isPremium = value;
      notifyListeners();
    }
}