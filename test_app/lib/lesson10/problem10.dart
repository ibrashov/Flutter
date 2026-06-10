import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class Course {
  final String title;
  final String description;
  final int lessons;
  final IconData icon;

  const Course({
    required this.title,
    required this.description,
    required this.lessons,
    required this.icon,
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter 10',
      home: const CoursesPage(),
    );
  }
}

class CoursesPage extends StatelessWidget {
  const CoursesPage({super.key});

  final List<Course> courses = const [
    Course(
      title: 'Dart Basics',
      description: 'Learn variables, functions, classes and null safety.',
      lessons: 8,
      icon: Icons.code,
    ),
    Course(
      title: 'Flutter Widgets',
      description: 'Learn Text, Container, Row, Column, Card and Button.',
      lessons: 12,
      icon: Icons.widgets,
    ),
    Course(
      title: 'Navigation',
      description: 'Learn how to move between pages.',
      lessons: 6,
      icon: Icons.navigation,
    ),
    Course(
      title: 'Forms',
      description: 'Learn TextField, TextFormField and validation.',
      lessons: 7,
      icon: Icons.edit,
    ),
    Course(
      title: 'State Management',
      description: 'Learn setState and app state basics.',
      lessons: 10,
      icon: Icons.refresh,
    ),
  ];

  void openCourseDetails(BuildContext context, Course course) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CourseDetailsPage(course: course),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter 10: ListView'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: courses.length,
        itemBuilder: (context, index) {
          final course = courses[index];

          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: CircleAvatar(
                child: Icon(course.icon),
              ),
              title: Text(
                course.title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(course.description),
              trailing: Text('${course.lessons} lessons'),
              onTap: () {
                openCourseDetails(context, course);
              },
            ),
          );
        },
      ),
    );
  }
}

class CourseDetailsPage extends StatelessWidget {
  final Course course;

  const CourseDetailsPage({
    super.key,
    required this.course,
  });

  void goBack(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Course Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              child: Icon(
                course.icon,
                size: 60,
              ),
            ),

            const SizedBox(height: 25),

            Text(
              course.title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            Text(
              course.description,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20),
            ),

            const SizedBox(height: 15),

            Text(
              'Lessons: ${course.lessons}',
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  goBack(context);
                },
                child: const Text('Back to courses'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}