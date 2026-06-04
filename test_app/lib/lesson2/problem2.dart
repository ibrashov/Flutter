import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

String getGreeting(String name) {
  return 'Hello $name';
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    String name = 'Anuar';
    int age = 19;
    bool isGay = false;

    List<String> skills = ['AI', 'C++', 'Java'];

    Map<String, String> person = {
      'name': 'Anuar',
      'age': '19',
      'city': 'Almaty',
      'country': 'Kazakhstan',
    };

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter problem 2',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('My problem 2'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                getGreeting(name),
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              Text(
                'Age: $age',
                style: const TextStyle(fontSize: 20),
              ),

              const SizedBox(height: 20),

              Text(
                'City: ${person['city']}',
                style: const TextStyle(fontSize: 20),
              ),

              const SizedBox(height: 10),

              Text(
                'Country: ${person['country']}',
                style: const TextStyle(fontSize: 20),
              ),

              const SizedBox(height: 10),

              Text(
                'Learning Flutter: ${!isGay}',
                style: const TextStyle(fontSize: 20),
              ),

              const SizedBox(height: 20),

              const Text(
                'My skills:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              Text(
                '1. ${skills[0]}',
                style: const TextStyle(fontSize: 18),
              ),
              Text(
                '2. ${skills[1]}',
                style: const TextStyle(fontSize: 18),
              ),
              Text(
                '3. ${skills[2]}',
                style: const TextStyle(fontSize: 18),
              ),

              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: () {
                  print('Name: $name');
                  print('Age: $age');
                  print('City: ${person['city']}');
                  print('Country: ${person['country']}');
                  print('Skills: $skills');
                },
                child: const Text('Show Info'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}