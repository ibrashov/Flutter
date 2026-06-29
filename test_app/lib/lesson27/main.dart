import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
void main(){
  runApp(const FutureBuilderPr());
}
class Post{
  final int id;
  final String title;
  final String body;
  Post({
    required this.id,
    required this.title,
    required this.body
  });
  factory Post.fromJson(Map<String, dynamic> json){
    return Post(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      body: json['body'] ?? ''
    );
  }
}
class PostService{
  final String baseUrl = 'https://jsonplaceholder.typicode.com/posts';
  Future<List<Post>> fetchPosts() async{
    final response = await http.get(Uri.parse(baseUrl));
    if(response.statusCode == 200){
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((item){return Post.fromJson(item);}).toList(); 
    }
    throw Exception('Failed to load posts: ${response.statusCode}');
  }
  Future<Post> fetchPostById(int id)async{
    final response = await http.get(Uri.parse('$baseUrl/$id'));
    if(response.statusCode == 200){
      final Map<String, dynamic> data = jsonDecode(response.body);
      return Post.fromJson(data);
    }
    throw Exception('Failed to load post: ${response.statusCode}');
  }

}
class FutureBuilderPr extends StatelessWidget{
  const FutureBuilderPr({super.key});
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Problem 27',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: const PostsPage();
    );
  }
}
class PostsPage extends StatefulBuilder{
  const PostsPage({super.key});
  State<PostsPage> createState(){
    return _PostPageState();
  }

}
class _PostPageState extends State<PostsPage>{
  final PostService postService = PostService();
  late Future<List<Post>> postsFuture;
  void initState(){
    super.initState();
    postsFuture = postService.fetchPosts();
  }
  void refreshPosts(){
    setState(() {
      postsFuture = postService.fetchPosts();
    });
  }
  void openPostDetails(BuildContext context, int postId){
    Navigator.push(
      context, 
      MaterialPageRoute(builder: (context){
        return PostDetailsPage(postId, postId);
      }),
    );
  }
  Widget buildLoading(){
    return const Center(child: CircularProgressIndicator());
  }
  Widget buildError(Object error){
    return Center(
      child: Padding(
        padding: const EdgeInsetsGeometry.all(20),
        child: Text(
          'Error: $error',
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)
        ),
      ),
    );
  }
  Widget buildEmpty(){
    return const Center(
      child: Text('No posts found', style: TextStyle(fontSize: 20))
    );
  }
  Widget buildPostsList(List<Post> posts){
    return ListView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: ,
    );
  }
}