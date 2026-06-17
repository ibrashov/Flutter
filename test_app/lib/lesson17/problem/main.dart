import 'package:flutter/material.dart';

void main() {
  runApp(const AssetPracticeApp());
}

class AssetPracticeApp extends StatelessWidget {
  const AssetPracticeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter 17',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
        ),
      ),
      home: const AssetHomePage(),
    );
  }
}

class AssetHomePage extends StatelessWidget {
  const AssetHomePage({super.key});

  void showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter 17: Assets'),
        actions: [
          IconButton(
            onPressed: () {
              showMessage(context, 'Assets practice');
            },
            icon: const Icon(Icons.info),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text(
            'My Asset Profile',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 25),

          Center(
            child: CircleAvatar(
              radius: 70,
              backgroundImage: const AssetImage(
                'assets/images/profile.png',
              ),
            ),
          ),

          const SizedBox(height: 25),

          Card(
            child: ListTile(
              leading: Image.asset(
                'assets/icons/flutter_logo.png',
                width: 40,
                height: 40,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.flutter_dash);
                },
              ),
              title: const Text('Flutter Developer'),
              subtitle: const Text('Learning assets, images and icons'),
            ),
          ),

          const SizedBox(height: 15),

          Card(
            child: ListTile(
              leading: const Icon(Icons.image),
              title: const Text('Image.asset'),
              subtitle: const Text(
                'Used for local images inside the project',
              ),
            ),
          ),

          Card(
            child: ListTile(
              leading: const Icon(Icons.folder),
              title: const Text('pubspec.yaml'),
              subtitle: const Text(
                'Used to register assets and fonts',
              ),
            ),
          ),

          const SizedBox(height: 25),

          ElevatedButton(
            onPressed: () {
              showMessage(context, 'Profile image loaded from assets');
            },
            child: const Text('Show Message'),
          ),
        ],
      ),
    );
  }
}