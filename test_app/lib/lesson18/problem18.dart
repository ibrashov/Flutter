import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const PackagePracticeApp());
}

class PackagePracticeApp extends StatelessWidget {
  const PackagePracticeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter 18',
      theme: ThemeData(
        useMaterial3: true,
        textTheme: GoogleFonts.poppinsTextTheme(),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
        ),
      ),
      home: const PackageHomePage(),
    );
  }
}

class PackageHomePage extends StatelessWidget {
  const PackageHomePage({super.key});

  void showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final packages = [
      'google_fonts',
      'http',
      'shared_preferences',
      'provider',
      'go_router',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter 18: Packages'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text(
            'Using Packages',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 20),

          Text(
            'Packages help you add ready-made features to your Flutter app.',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 18,
            ),
          ),

          const SizedBox(height: 25),

          Card(
            child: ListTile(
              leading: const Icon(Icons.font_download),
              title: Text(
                'google_fonts',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: const Text(
                'Used to apply fonts without manual font assets',
              ),
            ),
          ),

          const SizedBox(height: 10),

          Text(
            'Common Flutter packages:',
            style: GoogleFonts.poppins(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          ...packages.map(
            (packageName) {
              return Card(
                child: ListTile(
                  leading: const Icon(Icons.extension),
                  title: Text(packageName),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    showMessage(context, 'Package: $packageName');
                  },
                ),
              );
            },
          ),

          const SizedBox(height: 25),

          ElevatedButton(
            onPressed: () {
              showMessage(context, 'google_fonts package is working');
            },
            child: const Text('Test Package'),
          ),
        ],
      ),
    );
  }
}