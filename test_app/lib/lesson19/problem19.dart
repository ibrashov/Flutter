import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
void main(){
  runApp(const ApiPracticeApp());
}
class Post{
  final int id;
  final String title;
  final String body;
  const Post({
    required this.id,
    required this.title,
    required this.body
  });
  factory Post.fromJson(Map<String, dynamic> json){
    return Post(
      id:json['id'],
      title: json['title'],
      body: json['body']
    );
  }
}
class ApiPracticeApp extends StatelessWidget{
  const ApiPracticeApp({super.key});
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Problem 19',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue)
      ),
      home: const PostPage(),
    );

  }
}
class PostPage extends StatefulWidget{
  const PostPage({super.key});
  State<PostPage> createState(){
    return _PostPageState();
  }
}
class _PostPageState extends State<PostPage>{
  List<Post> posts = [];
  bool isLoading =false;
  String errMessage= '';
  Future<void> fetchPost() async{
    setState(() {
      isLoading = true;
      errMessage = '';
    });
    try{
      final response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/posts'),
      );
    if(response.statusCode == 200){
      final List<dynamic> data = jsonDecode(response.body);
      final loadedPost = data.map((item) {
        return Post.fromJson(item);
      }).toList();
      setState(() {
        posts =   loadedPost;
        isLoading = false;
      });
      print('Posts loading: ${posts.length}');
    }else{
      setState(() {
        errMessage = 'Error: ${response.statusCode}';
        isLoading = false;
      });
    }
    }catch (e){
      setState(() {
        errMessage = 'Something went wrong: $e';
        isLoading = false;
      });
    }
  }
  void clearPost(){
    setState(() {
      posts.clear();
      errMessage = '';
    });
  }
  void initState(){
    super.initState();
    fetchPost();
  }
  Widget buidBody(){
    if(isLoading){
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    if(errMessage.isNotEmpty){
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
            errMessage, textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      );
    }
    if(posts.isEmpty){
      return const Center(
        child: Text(
          'No context', 
          style: TextStyle(fontSize: 20)
        ),
      );
    }
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: posts.length,
      itemBuilder: (context,index){
        final post = posts[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 20),
          child: ListTile(
            leading: CircleAvatar(child: Text('${post.id}')),
            title: Text(
              post.title,
              style: const TextStyle(fontWeight: FontWeight.bold)
            ),
            subtitle: Text(post.body),
          ),
        );
      },
    );
  }
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter HTTP/API '),
        actions:[
          IconButton(
            onPressed: fetchPost,
            icon: const Icon(Icons.refresh),
          ),
        ]      
        ),
      body: buidBody()
    );
  }
}
