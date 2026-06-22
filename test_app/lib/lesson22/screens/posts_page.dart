import 'package:flutter/material.dart';

import '../models/post.dart';
import '../services/post_service.dart';

class PostsPage extends StatefulWidget {
  const PostsPage({super.key});

  @override
  State<PostsPage> createState() {
    return _PostsPageState();
  }
}

class _PostsPageState extends State<PostsPage> {
  final PostService postService = PostService();

  final titleController = TextEditingController();
  final bodyController = TextEditingController();

  List<Post> posts = [];
  bool isLoading = false;
  String message = 'Press refresh to load posts';

  Future<void> loadPosts() async {
    setState(() {
      isLoading = true;
      message = 'Loading posts...';
    });

    try {
      final loadedPosts = await postService.fetchPosts();

      setState(() {
        posts = loadedPosts;
        message = 'Posts loaded: ${posts.length}';
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        message = 'Error: $e';
        isLoading = false;
      });
    }
  }

  Future<void> addPost() async {
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
      message = 'Creating post...';
    });

    try {
      final newPost = await postService.createPost(
        title: title,
        body: body,
        userId: 1,
      );

      setState(() {
        posts.insert(0, newPost);
        titleController.clear();
        bodyController.clear();
        message = 'Post created: ${newPost.title}';
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        message = 'Error: $e';
        isLoading = false;
      });
    }
  }

  Future<void> removePost(int index) async {
    final post = posts[index];

    setState(() {
      isLoading = true;
      message = 'Deleting post...';
    });

    try {
      await postService.deletPosts(post.id);

      setState(() {
        posts.removeAt(index);
        message = 'Post deleted';
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        message = 'Error: $e';
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    loadPosts();
  }

  @override
  void dispose() {
    titleController.dispose();
    bodyController.dispose();
    super.dispose();
  }

  Widget buildForm() {
    return Column(
      children: [
        TextField(
          controller: titleController,
          decoration: const InputDecoration(
            labelText: 'Title',
            hintText: 'Enter post title',
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.title),
          ),
        ),

        const SizedBox(height: 12),

        TextField(
          controller: bodyController,
          maxLines: 3,
          decoration: const InputDecoration(
            labelText: 'Body',
            hintText: 'Enter post body',
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.description),
          ),
        ),

        const SizedBox(height: 12),

        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: isLoading ? null : addPost,
            child: const Text('Create Post'),
          ),
        ),
      ],
    );
  }

  Widget buildPostsList() {
    if (posts.isEmpty) {
      return const Center(
        child: Text(
          'No posts',
          style: TextStyle(fontSize: 20),
        ),
      );
    }

    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        final post = posts[index];

        return Card(
          margin: const EdgeInsets.only(bottom: 10),
          child: ListTile(
            leading: CircleAvatar(
              child: Text('${post.id}'),
            ),
            title: Text(
              post.title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(post.body),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: isLoading
                  ? null
                  : () {
                      removePost(index);
                    },
            ),
          ),
        );
      },
    );
  }

  Widget buildBody() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: buildForm(),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            message,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        const SizedBox(height: 10),

        if (isLoading)
          const LinearProgressIndicator(),

        const SizedBox(height: 10),

        Expanded(
          child: buildPostsList(),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter 22: API Service'),
        actions: [
          IconButton(
            onPressed: isLoading ? null : loadPosts,
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: buildBody(),
    );
  }
}