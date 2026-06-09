import 'package:flutter/material.dart';
import 'package:test_app/lesson1/problem1.dart';
void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget{
  const MyApp({super.key});
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Problem 8',
      home: const HomePage(),
    );
  }
}
class HomePage extends StatelessWidget{
  const HomePage({super.key});
  void openProfilePage(BuildContext context){
    Navigator.push(
      context, 
      MaterialPageRoute(builder: (context)=> const ProfilePage()),
    );
  }
  void openSettingPage(BuildContext context){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context)=> const SettingPage()),
    );
  }
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page')),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.home, size: 70),
            const SizedBox(height: 20),
            const Text('Home Page', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: (){
                  openProfilePage(context);
                },
                child: const Text('Open Profile'),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: (){
                  openSettingPage(context);
                },
                child: const Text('Settings'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class ProfilePage extends StatelessWidget{
  const ProfilePage({super.key});
  void goBack(BuildContext context){
    Navigator.pop(context);
  }
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Text('Profile Page')),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(radius: 50,child: Icon(Icons.person, size: 50)),
            const SizedBox(height: 20),
            const Text('Flutter Problem8', style: TextStyle(fontSize: 20)),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed:(){
                  goBack(context);
                } ,
                child: const Text('Back'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class SettingPage extends StatelessWidget{
  const SettingPage({super.key});
  void goBack(BuildContext context){
    Navigator.pop(context);
  }
  Widget build(BuildContext context){
    bool notifications = true;
    bool darkMode= false;
    return Scaffold(
      appBar: AppBar(title: const Text('Setting')),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            const Icon(Icons.settings, size: 80),
            const SizedBox(height: 20),
            const Text('Settings',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            Card(
              child: ListTile(
                leading: const Icon(Icons.notifications),
                title: const Text('Notifications'),
                trailing: Text(
                  notifications ? 'On':'Off',
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ),
            Card(
              child: ListTile(
                leading: const Icon(Icons.dark_mode),
                title: const Text('Dark Mode'),
                trailing: Text(
                  darkMode ? 'On': 'Off',
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: (){
                  goBack(context);
                },
                child:const Text('Go Back'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}