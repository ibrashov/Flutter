import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget{
  const MyApp({super.key});
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Problem 6',
      home: const InputPage(),
    );
  }
}
class InputPage extends StatefulWidget{
  const InputPage({super.key});
  State<InputPage> createState(){
    return _InputPageState();
  }
}
class _InputPageState extends State<InputPage>{
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  String result = 'Enter your data';
  void showData(){
    setState((){
      result = 'Name: ${nameController.text}\nAge: ${ageController.text}';
    });
  }
  void clearData(){
    setState(() {
      nameController.clear();
      ageController.clear();
      result = 'Data cleared';
    });
  }
  void dispose(){
    nameController.dispose();
    ageController.dispose();
    super.dispose();
  }
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title:const Text('Problem 6')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text('Use Form',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            const SizedBox(height:20),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Name',
                hintText: 'Enter your name',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person), 
              ),
            ),
            const SizedBox(height: 20,),
            TextField(
              controller: ageController,
              decoration: InputDecoration(
                labelText: 'Age',
                hintText: 'Enter your age', 
                border: OutlineInputBorder(),
                prefixIcon: Incon
              ),
            ),
          ],
        ),
      ),
    );
    }

}
