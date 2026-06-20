import 'package:flutter/material.dart';

import 'screens/posts_page.dart';

void main() {
  runApp(const ServicePracticeApp());
}

class ServicePracticeApp extends StatelessWidget {
  const ServicePracticeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter 22',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
        ),
      ),
      home: const PostsPage(),
    );
  }
}