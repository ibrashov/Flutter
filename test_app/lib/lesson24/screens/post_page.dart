import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/post_providers.dart';

class PostsPage extends StatefulWidget {
  const PostsPage({super.key});

  @override
  State<PostsPage> createState() {
    return _PostsPageState();
  }
}

class _PostsPageState extends State<PostsPage> {
  final titleController = TextEditingController();
  final bodyController = TextEditingController();

  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      context.read<PostProvider>().loadPosts();
    });
  }

  Future<void> createPost() async {
    final title = titleController.text;
    final body = bodyController.text;

    await context.read<PostProvider>().createPost(
          title: title,
          body: body,
        );

    titleController.clear();
    bodyController.clear();
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

        Consumer<PostProvider>(
          builder: (context, provider, child) {
            return SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: provider.isLoading ? null : createPost,
                child: const Text('Create Post'),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget buildPostList(PostProvider provider) {
    if (provider.posts.isEmpty) {
      return const Center(
        child: Text(
          'No posts',
          style: TextStyle(fontSize: 20),
        ),
      );
    }

    return ListView.builder(
      itemCount: provider.posts.length,
      itemBuilder: (context, index) {
        final post = provider.posts[index];

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
              onPressed: provider.isLoading
                  ? null
                  : () {
                      context.read<PostProvider>().deletePost(index);
                    },
            ),
          ),
        );
      },
    );
  }

  Widget buildBody() {
    return Consumer<PostProvider>(
      builder: (context, provider, child) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: buildForm(),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                provider.message,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 10),

            Text(
              'Total posts: ${provider.totalPosts}',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            if (provider.isLoading)
              const LinearProgressIndicator(),

            const SizedBox(height: 10),

            Expanded(
              child: buildPostList(provider),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = context.watch<PostProvider>().isLoading;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter 24: Provider'),
        actions: [
          IconButton(
            onPressed: isLoading
                ? null
                : () {
                    context.read<PostProvider>().loadPosts();
                  },
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: buildBody(),
    );
  }
}