import 'package:flutter/material.dart';
import 'package:test_app/lesson4/problem4.dart';
void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget{
  const MyApp({super.key});
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Problem 6',
      home: const LoginPage(),
    );
  }
}
class 