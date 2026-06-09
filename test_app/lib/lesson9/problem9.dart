import 'package:flutter/material.dart';
void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget{
  const MyApp({super.key});
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title:'Prblem 9',
      home : const HomePage()
    );
  }
}
class HomePage extends StatefulWidget{
  const HomePage({super.key});
  State<HomePage> createState(){
    return _HomePageState();
  }
}
class _HomePageState extends State<HomePage>{
  String selectedResult = 'No result yet';
  Future<void> openProfilePage() async{
    final result = await Navigator.push(
      context, 
      MaterialPageRoute(
        builder: (context) => const ProfilePage(
          name: 'Anuar',
          age: 19,
          city: 'Almaty',
        ),
      ),
    );
    if(result != null){
      setState((){
        selectedResult = result;
      });
    }
  }
  Future<void> openCoursePage() async{
    final result = await Navigator.push(
      context, 
      MaterialPageRoute(
        builder: (context) => const CoursePage(
          courseName: 'Flutter Problems',
          lessonCount: 15,
        ),
      ),
    );
    if(result != null){
      setState((){
        selectedResult = result;
      });
    }
  }
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Problem9')),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.home, size: 60),
            const SizedBox(height: 20),
            const Text('Home Page',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20,),
            Text(
              'Result: $selectedResult',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20,),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: openProfilePage,
                child: const Text('Open Profile Page')
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: openCoursePage,
                child: const Text('Open Course Page')
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class ProfilePage extends StatelessWidget{
  final String name;
  final int age;
  final String city;
  const ProfilePage({
    super.key,
    required this.name,
    required this.age,
    required this.city
    });
    void goBackWithResult(BuildContext context){
      Navigator.pop(context, 'Profile viewed:$name');
    }
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Text('Profile Page')),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(radius: 50, child: Icon(Icons.person, size: 40)),
            const SizedBox(height: 20),
            Text(name,style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            Text('Age: $age', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            Text('City: $city', style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
            const SizedBox(height: 20,),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: (){
                  goBackWithResult(context);
                },
                child: const Text('Go Back With Results'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class CoursePage extends StatelessWidget{
  final String courseName;
  final int lessonCount;
  const CoursePage({
    super.key,
    required this.courseName,
    required this.lessonCount,
  });
  void completedCourse(BuildContext context){
    Navigator.pop(context, 'Completed course: $courseName');
  }
  void cancelCourse(BuildContext context){
    Navigator.pop(context, 'Course canceled');
  }
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Text('Problem 9 test')),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.school, size: 60),
            const SizedBox(height: 20),
            Text(courseName, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
            const SizedBox(height: 20),
            Text('Lesson: $lessonCount',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold) ),
            const SizedBox(height: 20,),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed:(){
                  completedCourse(context);
                },
                child: const Text('Completed Course'),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: (){
                  cancelCourse(context);
                },
                child: const Text('Canceled Course'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}