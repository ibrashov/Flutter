import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const CrudPracticeApp());
}

class ApiPost {
  final int id;
  final String title;
  final String body;
  final int userId;

  const ApiPost({
    required this.id,
    required this.title,
    required this.body,
    required this.userId,
  });

  factory ApiPost.fromJson(Map<String, dynamic> json) {
    return ApiPost(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      body: json['body'] ?? '',
      userId: json['userId'] ?? 0,
    );
  }
}

class CrudPracticeApp extends StatelessWidget {
  const CrudPracticeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter 21',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
        ),
      ),
      home: const CrudPage(),
    );
  }
}

class CrudPage extends StatefulWidget {
  const CrudPage({super.key});

  @override
  State<CrudPage> createState() {
    return _CrudPageState();
  }
}

class _CrudPageState extends State<CrudPage> {
  final titleController = TextEditingController();
  final bodyController = TextEditingController();

  bool isLoading = false;
  String message = 'Choose an action';
  ApiPost? post;

  final String baseUrl = 'https://jsonplaceholder.typicode.com/posts';

  Future<void> fetchPost() async {
    setState(() {
      isLoading = true;
      message = 'Loading post...';
    });

    try {
      final response = await http.get(
        Uri.parse('$baseUrl/1'),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);

        setState(() {
          post = ApiPost.fromJson(data);
          titleController.text = post!.title;
          bodyController.text = post!.body;
          message = 'Post loaded';
          isLoading = false;
        });
      } else {
        setState(() {
          message = 'GET error: ${response.statusCode}';
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        message = 'GET failed: $e';
        isLoading = false;
      });
    }
  }

  Future<void> updatePostWithPut() async {
    final title = titleController.text.trim();
    final body = bodyController.text.trim();

    if (title.isEmpty || body.isEmpty) {
      setState(() {
        message = 'Please enter title and body';
      });
      return;
    }

    setState(() {
      isLoading = true;
      message = 'Updating with PUT...';
    });

    try {
      final response = await http.put(
        Uri.parse('$baseUrl/1'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          'id': 1,
          'title': title,
          'body': body,
          'userId': 1,
        }),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);

        setState(() {
          post = ApiPost.fromJson(data);
          message = 'Post updated with PUT';
          isLoading = false;
        });

        print('PUT updated: ${post!.title}');
      } else {
        setState(() {
          message = 'PUT error: ${response.statusCode}';
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        message = 'PUT failed: $e';
        isLoading = false;
      });
    }
  }

  Future<void> updatePostWithPatch() async {
    final title = titleController.text.trim();

    if (title.isEmpty) {
      setState(() {
        message = 'Please enter title';
      });
      return;
    }

    setState(() {
      isLoading = true;
      message = 'Updating with PATCH...';
    });

    try {
      final response = await http.patch(
        Uri.parse('$baseUrl/1'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          'title': title,
        }),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);

        setState(() {
          post = ApiPost.fromJson(data);
          message = 'Post updated with PATCH';
          isLoading = false;
        });

        print('PATCH updated title: ${post!.title}');
      } else {
        setState(() {
          message = 'PATCH error: ${response.statusCode}';
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        message = 'PATCH failed: $e';
        isLoading = false;
      });
    }
  }

  Future<void> deletePost() async {
    setState(() {
      isLoading = true;
      message = 'Deleting post...';
    });

    try {
      final response = await http.delete(
        Uri.parse('$baseUrl/1'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode == 200) {
        setState(() {
          post = null;
          titleController.clear();
          bodyController.clear();
          message = 'Post deleted';
          isLoading = false;
        });

        print('Post deleted');
      } else {
        setState(() {
          message = 'DELETE error: ${response.statusCode}';
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        message = 'DELETE failed: $e';
        isLoading = false;
      });
    }
  }

  void clearScreen() {
    setState(() {
      post = null;
      titleController.clear();
      bodyController.clear();
      message = 'Screen cleared';
    });
  }

  @override
  void initState() {
    super.initState();
    fetchPost();
  }

  @override
  void dispose() {
    titleController.dispose();
    bodyController.dispose();
    super.dispose();
  }

  Widget buildPostCard() {
    if (post == null) {
      return const Card(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Text(
            'No post data',
            style: TextStyle(fontSize: 18),
          ),
        ),
      );
    }

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Current Post',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              'ID: ${post!.id}',
              style: const TextStyle(fontSize: 18),
            ),

            const SizedBox(height: 8),

            Text(
              'User ID: ${post!.userId}',
              style: const TextStyle(fontSize: 18),
            ),

            const SizedBox(height: 8),

            Text(
              'Title: ${post!.title}',
              style: const TextStyle(fontSize: 18),
            ),

            const SizedBox(height: 8),

            Text(
              'Body: ${post!.body}',
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildActionButtons() {
    if (isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: fetchPost,
                child: const Text('GET'),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: ElevatedButton(
                onPressed: updatePostWithPut,
                child: const Text('PUT'),
              ),
            ),
          ],
        ),

        const SizedBox(height: 10),

        Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: updatePostWithPatch,
                child: const Text('PATCH'),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: OutlinedButton(
                onPressed: deletePost,
                child: const Text('DELETE'),
              ),
            ),
          ],
        ),

        const SizedBox(height: 10),

        SizedBox(
          width: double.infinity,
          child: TextButton(
            onPressed: clearScreen,
            child: const Text('Clear Screen'),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter 21: PUT PATCH DELETE'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Icon(
            Icons.api,
            size: 90,
          ),

          const SizedBox(height: 20),

          const Text(
            'CRUD API Practice',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 25),

          TextField(
            controller: titleController,
            decoration: const InputDecoration(
              labelText: 'Title',
              hintText: 'Enter title',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.title),
            ),
          ),

          const SizedBox(height: 15),

          TextField(
            controller: bodyController,
            maxLines: 4,
            decoration: const InputDecoration(
              labelText: 'Body',
              hintText: 'Enter body',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.description),
            ),
          ),

          const SizedBox(height: 20),

          buildActionButtons(),

          const SizedBox(height: 25),

          Text(
            message,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 20),

          buildPostCard(),
        ],
      ),
    );
  }
}