import 'package:flutter/material.dart';
void main(){
  runApp( const MyApp());
}
class MyApp extends StatefulWidget{
  const MyApp({super.key});
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Problem5 ',
      home: const CounterPage(),
    );
  }
}
class CounterPage extends StatefulWidget{
  const CounterPage({super.key});
  State<CounterPage> createState(){
    return _CounterPageState();
  }
}
class ConterPageState extends State<CounterPage>{
  int counter = 0;
  String message = 'Press the button';
  void increaseCounter(){
    setState(() {
      counter++;
      message = 'Counter increased';
    });
  }
  void decreaseCounter(){
    setState(() {
      counter--;
      message = 'Counter decreased';
    });
  }
  void resetCounter(){
    setState(() {
      counter = 0;
      message = ' Counter reseted';
    });
  }
  
}