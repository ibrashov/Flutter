import 'package:flutter/material.dart';

import '../models/post.dart';
import '../repo/post_repository.dart';
import '../services/post_services.dart';

class PostsPage extends StatefulWidget {
  const PostsPage({super.key});

  @override
  State<PostsPage> createState() {
    return _PostsPageState();
  }
}

class _PostsPageState extends State<PostsPage> {
  late final PostRepository postRepository;

  final titleController = TextEditingController();
  final bodyController = TextEditingController();

  List<Post> posts = [];
  bool isLoading = false;
  String message = 'Loading posts...';

  @override
  void initState() {
    super.initState();

    postRepository = PostRepository(
      postService: PostService(),
    );

    loadPosts();
  }

  Future<void> loadPosts() async {
    setState(() {
      isLoading = true;
      message = 'Loading posts...';
    });

    try {
      final loadedPosts = await postRepository.getPosts();

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

  Future<void> createPost() async {
    final title = titleController.text;
    final body = bodyController.text;

    setState(() {
      isLoading = true;
      message = 'Creating post...';
    });

    try {
      final newPost = await postRepository.addPost(
        title: title,
        body: body,
      );

      setState(() {
        posts.insert(0, newPost);
        titleController.clear();
        bodyController.clear();
        message = 'Post created';
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        message = 'Error: $e';
        isLoading = false;
      });
    }
  }

  Future<void> deletePost(int index) async {
    final post = posts[index];

    setState(() {
      isLoading = true;
      message = 'Deleting post...';
    });

    try {
      await postRepository.removePost(post.id);

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
            onPressed: isLoading ? null : createPost,
            child: const Text('Create Post'),
          ),
        ),
      ],
    );
  }

  Widget buildPostList() {
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
                      deletePost(index);
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
          child: buildPostList(),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter 23: Repository Pattern'),
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