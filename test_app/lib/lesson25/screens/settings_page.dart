import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/theme_provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = context.watch<ThemeProvider>().isDarkMode;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Icon(
              Icons.settings,
              size: 90,
            ),

            const SizedBox(height: 20),

            const Text(
              'Settings',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 30),

            Card(
              child: SwitchListTile(
                value: isDarkMode,
                onChanged: (value) {
                  context.read<ThemeProvider>().toggleTheme(value);
                },
                title: const Text('Dark Mode'),
                subtitle: const Text('Change app theme'),
                secondary: Icon(
                  isDarkMode ? Icons.dark_mode : Icons.light_mode,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}