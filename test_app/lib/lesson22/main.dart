import 'package:flutter/material.dart';
import 'screens/post_page.dart';
void main(){
  runApp(const ServicePracticeApp);
}
class ServicePracriceApp extends StatelessWidget{
  const ServicePracriceApp({super.key});
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Problem 22 Flutter',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue
        ),
      ),
      home: const PostPage(),
    );
  }
}