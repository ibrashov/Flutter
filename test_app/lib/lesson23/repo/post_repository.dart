import '../models/post.dart';
import '../services/post_services.dart';

class PostRepository {
  final PostService postService;

  PostRepository({
    required this.postService,
  });

  Future<List<Post>> getPosts() async {
    try {
      final posts = await postService.fetchPosts();

      final filteredPosts = posts.where((post) {
        return post.title.isNotEmpty && post.body.isNotEmpty;
      }).toList();

      return filteredPosts;
    } catch (e) {
      throw Exception('Repository error while getting posts: $e');
    }
  }

  Future<Post> addPost({
    required String title,
    required String body,
  }) async {
    try {
      final cleanTitle = title.trim();
      final cleanBody = body.trim();

      if (cleanTitle.isEmpty) {
        throw Exception('Title cannot be empty');
      }

      if (cleanBody.isEmpty) {
        throw Exception('Body cannot be empty');
      }

      final newPost = await postService.createPost(
        title: cleanTitle,
        body: cleanBody,
        userId: 1,
      );

      return newPost;
    } catch (e) {
      throw Exception('Repository error while adding post: $e');
    }
  }

  Future<void> removePost(int id) async {
    try {
      await postService.deletePost(id);
    } catch (e) {
      throw Exception('Repository error while deleting post: $e');
    }
  }
}