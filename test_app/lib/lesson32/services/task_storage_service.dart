import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/task.dart';

class TaskStorageService {
  final SharedPreferencesAsync prefs = SharedPreferencesAsync();

  static const String tasksKey = 'tasks';

  Future<List<Task>> loadTasks() async {
    final savedTasks = await prefs.getString(tasksKey);

    if (savedTasks == null) {
      return [];
    }

    final List<dynamic> decodedData = jsonDecode(savedTasks);

    return decodedData.map((item) {
      final map = Map<String, dynamic>.from(item);
      return Task.fromJson(map);
    }).toList();
  }

  Future<void> saveTasks(List<Task> tasks) async {
    final taskJsonList = tasks.map((task) {
      return task.toJson();
    }).toList();

    final taskJsonString = jsonEncode(taskJsonList);

    await prefs.setString(tasksKey, taskJsonString);
  }

  Future<void> clearTasks() async {
    await prefs.remove(tasksKey);
  }
}