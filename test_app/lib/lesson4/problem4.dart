import 'package:flutter/material.dart';
void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget{
  const MyApp({super.key});
  Widget buildSkillBox(String text){
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text, style: const TextStyle(fontSize: 19)
      ),
    );
  }
}
Widget build(BuildContext context){
  List<String> skills = ['Flutter', 'Dart', 'Python', 'Django Framework'];
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Problem 5',
    home: Scaffold(
      appBar: AppBar(title: const Text('Flutter Layout Problem 5')),
      body:SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:[
              const Text('Layout profile', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              Row(
                children:[
                  const CircleAvatar(radius: 45, child: Icon(Icons.person, size: 50)),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const[
                        Text('Anuar', style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
                        SizedBox(height: 10),
                        Text('Flutter Beginner', style: TextStyle(fontSize: 16)),
                      ],
                    ),
                  ),
                ],
              ),
              
            ],
          ),
        ),
      ),
    ),
  );
}