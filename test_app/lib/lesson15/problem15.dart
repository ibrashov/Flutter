import 'package:flutter/material.dart';
void main(){
  runApp(const ThemePracticeApp());
} 
class ThemePracticeApp extends StatefulWidget{
  const ThemePracticeApp({super.key});
  State<ThemePracticeApp> createState(){
    return _ThemePracticeAppState();
  }
}
class _ThemePracticeAppState extends State<ThemePracticeApp>{
  bool isDarkMode = false;
  void toggleTheme(bool value){
    setState(() {
      isDarkMode = value;
    });
  }
  ThemeData buildLightTheme(){
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.green,
        brightness: Brightness.light,
      ),
      appBarTheme: const AppBarTheme(centerTitle: true,),
      cardTheme: CardThemeData(
        elevation: 3,
        margin: EdgeInsets.only(bottom: 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12 ))
      ),
    );
  }
  ThemeData buildDarkTheme(){
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange, brightness: Brightness.dark),
      appBarTheme: const AppBarTheme(centerTitle: true),
      cardTheme: CardThemeData(
        elevation: 12,
        margin: const EdgeInsets.only(bottom: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16)
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12))
      ),
    );
  }
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowMaterialGrid: false,
      title: 'Probelm 15',
      theme: buildLightTheme(),
      darkTheme: buildDarkTheme(),
      themeMode: isDarkMode ? ThemeMode.dark: ThemeMode.light,
      home: ThemeHomePage(isDarkMode: isDarkMode, onThemeChanged: toggleTheme),
    );
  }
}
class ThemeHomePage extends StatelessWidget{
  final bool isDarkMode;
  final ValueChanged<bool> onThemeChanged;
  const ThemeHomePage({
    super.key,
    required this.isDarkMode,
    required this.onThemeChanged,
  });
  void showMessage(BuildContext context, String message){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message),)
    );
  }
  Widget build(BuildContext context){
    final ColorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter problem 15'),
        actions: [
          IconButton(
            onPressed: (){
              showMessage(context, 'Theme pracrice app');
            },
            icon: const Icon(Icons.info)
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Icon(
            isDarkMode ?  Icons.dark_mode : Icons.light_mode,
            size: 80,
            color: ColorScheme.primary
          ),
          const SizedBox(height: 20),
          Text(
            isDarkMode ? 'Dark Mode': 'Light Mode',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 20),
          Card(
            child: SwitchListTile(
              value : isDarkMode,
              onChanged: onThemeChanged,
              title: const Text('Dark Mode'),
              subtitle: const Text('Switch app theme'),
              secondary: Icon(isDarkMode? Icons.dark_mode : Icons.light_mode),
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.palette),
              title: const Text('Color Scheme'),
              subtitle: Text('Primary color is taken from Theme.of(context).colorScheme.primary'),
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.text_fields),
              title: const Text('Text Theme'),
              subtitle: Text('This text uses the app theme automatically.', style: Theme.of(context).textTheme.bodyMedium),
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            decoration: const InputDecoration(
              labelText: 'Your name',
              hintText: 'Enter your name',
              prefixIcon: Icon(Icons.person)
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: (){
              showMessage(context,'Button pressed');
            },
            child: const Text('Save'),
          ),
          const SizedBox(height: 20),
          OutlinedButton(
            onPressed: (){
              showMessage(context, 'Oulined button pressed');
            },
            child: const Text('Cancel'),
          ),
        ],
      ),
    );
  }
}
