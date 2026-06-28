import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/lesson5/problem5.dart';

import '../providers/count_provider.dart';
import '../providers/theme_provider.dart';
import 'count_page.dart';
import 'settings_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void openCounterPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const CounterPage();
        },
      ),
    );
  }

  void openSettingsPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const SettingsPage();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final counter = context.watch<CounterProvider>().counter;
    final isDarkMode = context.watch<ThemeProvider>().isDarkMode;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter 25: MultiProvider'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              isDarkMode ? Icons.dark_mode : Icons.light_mode,
              size: 90,
            ),

            const SizedBox(height: 20),

            Text(
              'Counter: $counter',
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              isDarkMode ? 'Theme: Dark' : 'Theme: Light',
              style: const TextStyle(fontSize: 22),
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  openCounterPage(context);
                },
                child: const Text('Open Counter Page'),
              ),
            ),

            const SizedBox(height: 10),

            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {
                  openSettingsPage(context);
                },
                child: const Text('Open Settings Page'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}