import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/post.dart';

class PostService {
  final String baseUrl = 'https://jsonplaceholder.typicode.com/posts';

  Future<List<Post>> fetchPosts() async {
    final response = await http.get(
      Uri.parse(baseUrl),
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);

      return data.map((item) {
        return Post.fromJson(item);
      }).toList();
    } else {
      throw Exception('Failed to load posts: ${response.statusCode}');
    }
  }
  Future <Post> fetchPostById(int id) async{
    final response = await http.get(Uri.parse('$baseUrl/$id'),);
    if(response.statusCode == 200){
      final Map<String, dynamic> data = jsonDecode(response.body);
      return Post.fromJson(data);
    }else{
      throw Exception('Failed to load post: ${response.statusCode}');
    }
  } 
  Future<Post> createPost({
    required String title,
    required String body,
    required int userId,
  })async{
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {'Conten-type': 'application/json; charest=UTF-8'},
      body: jsonEncode({
        'title': title,
        'body':body,
        'userId': userId
      })
    );
    if(response.statusCode == 201){
      final Map<String, dynamic> data = jsonDecode(response.body);
      return Post.fromJson(data);
    }else{
      throw Exception('Failed to create post: ${response.statusCode}');
    }
  }
  Future<Post> updatedPost({
    required int id,
    required String title,
    required String body,
    required int userId
  })async{
    final response = await http.put(
      Uri.parse('$baseUrl/$id'),
      headers: {'Conten-Type':'application/json; charset=UTF-8'},
      body:jsonEncode({
        'id': id,
        'title': title,
        'body': body,
        'userId': userId
      }),
    );
    if(response.statusCode == 200){
      final Map<String, dynamic> data = jsonDecode(response.body);
      return Post.fromJson(data);
    }else{
      throw Exception('Failed to update post: ${response.statusCode}');
    }
  }
  Future <void> deletedPost(int id) async{
    final response = await http.delete(
      Uri.parse('$baseUrl/$id'),
      headers: {'Content-type':'application/json; charest=UTF-8'},
    );
    if(response.statusCode == 200 || response.statusCode==204){
      return;
    }else{
      throw Exception('Failed to delete post: ${response.statusCode}');
    }
  }
  
}