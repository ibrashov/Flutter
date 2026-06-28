import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'repo/post_repo.dart';
import 'screens/post_page.dart';
import 'services/post_service.dart';
import 'providers/post_providers.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) {
        return PostProvider(
          postRepo: PostRepo(
            postService: PostService(),
          ),
        );
      },
      child: const ProviderPracticeApp(),
    ),
  );
}

class ProviderPracticeApp extends StatelessWidget {
  const ProviderPracticeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter 24',
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