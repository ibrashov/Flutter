import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
void main(){
  runApp(const CrudPracticeApp());
}
class ApiPost{
  final int id;
  final String title;
  final String body;
  final int userId;
  const ApiPost({
    required this.id,
    required this.title,
    required this.body,
    required this.userId
  });
  factory ApiPost.fromJson(Map<String, dynamic> josn){
      return ApiPost(
        id: json['id'] ?? 0,
        title: json['title'] ?? '',
        body: json['body'] ?? '',
        userId: json['userId'] ?? 0
      );
    }
}
class CrudPracticeApp extends StatelessWidget{
  const CrudPracticeApp({super.key});
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Problem 21 Flutter',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: const CrudPage()
    );
  }
}
class CrudPage extends StatefulWidget{
  const CrudPage({super.key});
  State<CrudPage> createState(){
    return _CrudPageState();
  }
}
class _CrudPageState extends State<CrudPage>{
  final titleController = TextEditingController();
  final bodyController = TextEditingController();
  bool isLoading = false;
  String message = 'Chose a action';
  ApiPost? post;
  final String baseurl = 'https://jsonplaceholder.typicode.com/posts';
  Future<void> fetchPost() async{
    setState(() {
      isLoading = true;
      message = 'Loading post...';
    });
    try{
      final response = await http.get(Uri.parse('$baseurl/1'));
      if(response.statusCode == 200){
        final Map<String, dynamic> data = jsonDecode(response.body);
        setState(() {
          post = ApiPost.fromJson(data);
          titleController.text = post!.title;
          bodyController.text = post!.body;
          message = 'Post loaded';
          isLoading = false;
        });
      }else{
        setState(() {
          message = 'GET error : ${response.statusCode}';
          isLoading = false;
        });
      }
    }catch(e){
      setState(() {
        message = 'GET failed: $e';
        isLoading = false;
      });
    }
  }
  Future<void> updatePostWithPut() async{
    final title = titleController.text.trim();
    final blody = bodyController.text.trim();
    
  }
}
