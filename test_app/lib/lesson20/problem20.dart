import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
void main(){
    runApp(const PostPracticeApp());
}
class CreatedPost{
    final int id;
    final String title;
    final String body;
    final int userId;
    const CreatedPost({
        required this.id,
        required this.title,
        required this.body,
        required this.userId
    });
    factory CreatedPost.fromJson(Map<String, dynamic> json){
        return CreatedPost(
            id: json['id'],
            title: json['title'],
            body: json['body'],
            userId: json['userId']
        );
    }
}
class PostPracticeApp extends StatelessWidget{
    const PostPracticeApp({super.key});
    Widget build(BuildContext context){
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Problem 20 Flutter',
            theme: ThemeData(
                useMaterial3: true,
                colorScheme: ColorScheme.fromSeed( seedColor: Colors.blue),
            ),
            home: const CreatePostPage(),
        );
    }
}
class CreatePostPage extends StatefulWidget{
    const CreatePostPage({super.key});
    State<CreatePostPage> createState(){
        return _CreatePostPageState();
    }
}
class _CreatePostPageState extends State<CreatePostPage>{
    final titleController = TextEditingController();
    final bodyController = TextEditingController();
    bool isLoaded = false;
    String message = 'Create new post';
    CreatedPost? createdPost;
    Future<void> createPost() async{
        final title = titleController.text.trim();
        final body = bodyController.text.trim();
        if(title.isEmpty || body.isEmpty){
            setState(() {
              message = 'Plese eneter title and body';
            });
            return;
        }
        setState(() {
          isLoaded = true;
          message = 'Sendig data';
          createdPost = null;
        });
        try{
            final response = await http.post(
                Uri.parse('https://jsonplaceholder.typicode.com/posts',),
                headers: {'Content-Type': 'application/json; charset=UTF-8'},
                body: jsonEncode({
                    'title' : title,
                    'body' : body,
                    'userId' : 1,  
                }),

            );
            if(response.statusCode == 201){
                final Map<String, dynamic>data = jsonDecode(response.body);
                setState(() {
                  createdPost = CreatedPost.fromJson(data);
                  message = 'Post created successfuly';
                  isLoaded = false;
                  titleController.clear();
                  bodyController.clear();
                });
                print('Created post id: ${createdPost!.id}');

            }else{
                setState(() {
                  message = 'Error: ${response.statusCode}';
                  isLoaded = false;
                });
            }
        }catch(e){
            setState((){
                message = 'Something went wrong $e';
                isLoaded = false;
            });
        }
    }
    void clearForm(){
        setState((){
            titleController.clear();
            bodyController.clear();
            createdPost = null;
            message = 'Form cleared';
        });
    }
    void dispose(){
        titleController.dispose();
        bodyController.dispose();
        super.dispose();
    }
    Widget buildCreatedPostCard(){
        if(createdPost == null){
            return const SizedBox();
        }
        return Card(
            child: Padding(
                padding:const EdgeInsets.all(20),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                        const Text('Created post', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 10),
                        Text('ID: ${createdPost!.id}', style: TextStyle(fontSize: 20)),
                        const SizedBox(height:10),
                        Text('USERID: ${createdPost!.userId}', style: TextStyle(fontSize: 20)),
                        const SizedBox(height:10),
                        Text('Title: ${createdPost!.title}', style: TextStyle(fontSize: 20)),
                        const SizedBox(height: 10),
                        Text('Body: ${createdPost!.body}', style: TextStyle(fontSize: 20)),
                    ],
                ),
            ),
        );
    }
    Widget buildSendButton(){
        if(isLoaded){
            return const Center(
                child: CircularProgressIndicator(),
            );
        }
        return Row(
            children: [
                Expanded(
                    child: ElevatedButton(
                        onPressed: createPost,
                        child: const Text('Create Post')
                    ),
                ),
                const SizedBox(height: 20),
                Expanded(
                    child: OutlinedButton(
                        onPressed: clearForm,
                        child: const Text('Clear')
                    ),
                ),
            ],
        );
    }
     Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter 20: HTTP POST'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Icon(
            Icons.cloud_upload,
            size: 90,
          ),

          const SizedBox(height: 20),

          const Text(
            'Create Post',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 25),

          TextField(
            controller: titleController,
            decoration: const InputDecoration(
              labelText: 'Title',
              hintText: 'Enter post title',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.title),
            ),
          ),

          const SizedBox(height: 15),

          TextField(
            controller: bodyController,
            maxLines: 4,
            decoration: const InputDecoration(
              labelText: 'Body',
              hintText: 'Enter post body',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.description),
            ),
          ),

          const SizedBox(height: 20),

          buildSendButton(),

          const SizedBox(height: 25),

          Text(
            message,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 20),

          buildCreatedPostCard(),
        ],
      ),
    );
  }
}
