import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/dashboard_provider.dart';
import 'screens/dashboard_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) {
        return DashboardProvider();
      },
      child: const SelectorPracticeApp(),
    ),
  );
}

class SelectorPracticeApp extends StatelessWidget {
  const SelectorPracticeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter 26',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
        ),
      ),
      home: const DashboardPage(),
    );
  }
}