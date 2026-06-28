import '../models/post.dart';
import '../services/post_service.dart';
class PostRepo {
  final PostService postService;
  PostRepo({required this.postService});
  Future<List<Post>> getPosts() async{
    final posts = await postService.fetchPosts();
    return posts.where((post){
      return post.title.isNotEmpty && post.body.isNotEmpty;
    }).toList();
  }
  Future<Post> addPost({
    required String title,
    required String body
  })async {
    final cleanTitle = title.trim();
    final cleanBody = body.trim();
    if(cleanTitle.isEmpty){
      throw Exception('Title cannot be empty');
    }
    if(cleanBody.isEmpty){
      throw Exception('Body cannot be empty');
    }
    return postService.createPost(title: cleanTitle, body: cleanBody, userId: 1);

  }
  Future<void> removePost(int id) async{
    await postService.deletePost(id);
  }
}