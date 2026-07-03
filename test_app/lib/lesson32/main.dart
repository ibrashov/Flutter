import 'package:flutter/material.dart';

import 'screens/tasks_page.dart';

void main() {
  runApp(const StorageServicePracticeApp());
}

class StorageServicePracticeApp extends StatelessWidget {
  const StorageServicePracticeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter 32',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
        ),
      ),
      home: const TasksPage(),
    );
  }
}