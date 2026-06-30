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
      home: const PostsPage()
    );
  }
}
class PostsPage extends StatefulWidget{
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
        return PostDetailsPage(postId: postId);
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
      itemCount: posts.length,
      itemBuilder: (context, index){
        final post = posts[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 20),
          child: ListTile(
            leading: CircleAvatar(child: Text('${post.id}')),
            title: Text(post.title, style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text(post.body, style: TextStyle(fontWeight: FontWeight.bold)),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: (){openPostDetails(context, post.id);},
            ),

        );
      },
    );
  }
  Widget buildPostFuture(){
    return FutureBuilder<List<Post>>(
      future: postsFuture,
      builder: (context, snapshot){
        if(snapshot.connectionState == ConnectionState.waiting){
          return buildLoading();
        }
        if(snapshot.hasError){
          return buildError(snapshot.error!);
        }
        if(!snapshot.hasData || snapshot.data!.isEmpty){
          return buildEmpty();
        }
        final posts = snapshot.data!;
        return buildPostsList(posts);

      }
    );
  }
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Problem 27: FutureBuilder'),
        actions: [
          IconButton(onPressed: refreshPosts, icon: const Icon(Icons.refresh))
        ],
      ),
      body: buildPostFuture()
    );
  }
}
class PostDetailsPage extends StatelessWidget{
  final int postId;
  const PostDetailsPage({super.key, required this.postId});
  Widget build(BuildContext context){
    final PostService postService = PostService();
    return Scaffold(
      appBar: AppBar(title: const Text('Post Details')),
      body: FutureBuilder<Post>(
        future: postService.fetchPostById(postId),
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator());
          }
          if(snapshot.hasError){
            return Center(
              child: Padding(
                padding: const EdgeInsetsGeometry.all(20),
                child: Text(
                  'Error: ${snapshot.error}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 20)
                ),
              ),
            );
          }
          if(!snapshot.hasData){
            return const Center(child: Text('No post found', style: TextStyle(fontSize: 20)));
          }
          final post = snapshot.data!;
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(radius: 25, child: Text('${post.id}')),
                const SizedBox(height: 20),
                Text(post.title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 20),
                Text(post.body, style: const TextStyle(fontSize: 20))
              ]
            ),
          );
        }
      ),
    );
  }
}