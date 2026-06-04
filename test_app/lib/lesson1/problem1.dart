import 'package:flutter/material.dart';
void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget{
  const MyApp({super.key});
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      title:'Flutter Problem 1',
      home:Scaffold(
        appBar: AppBar(
          title:const Text('My problem 1'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment:MainAxisAlignment.center,
            children:[
              const Text(
                "Hello World",
                style: TextStyle(fontSize: 18, fontWeight:FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text("Welcome to my problem 1", style: TextStyle(fontSize: 20)),
              const SizedBox(height: 20),
              const Text("This is a problem 1 done", style: TextStyle(fontSize:16)),
              ElevatedButton(
                onPressed:(){
                  print("Buttom is pressed");
                },
                child:const Text("Press me"),
              ),
            ],
          ),
        ),
        ),
    );
  }
}