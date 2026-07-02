import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const SharedPreferencesPracticeApp());
}

class SharedPreferencesPracticeApp extends StatefulWidget {
  const SharedPreferencesPracticeApp({super.key});

  @override
  State<SharedPreferencesPracticeApp> createState() {
    return _SharedPreferencesPracticeAppState();
  }
}

class _SharedPreferencesPracticeAppState
    extends State<SharedPreferencesPracticeApp> {
  final SharedPreferencesAsync prefs = SharedPreferencesAsync();

  final nameController = TextEditingController();
  final cityController = TextEditingController();

  static const String nameKey = 'name';
  static const String cityKey = 'city';
  static const String counterKey = 'counter';
  static const String darkModeKey = 'isDarkMode';

  String name = 'Guest';
  String city = 'Almaty';
  int counter = 0;
  bool isDarkMode = false;

  bool isLoading = true;
  String message = 'Loading saved data...';

  @override
  void initState() {
    super.initState();
    loadSavedData();
  }

  Future<void> loadSavedData() async {
    final savedName = await prefs.getString(nameKey);
    final savedCity = await prefs.getString(cityKey);
    final savedCounter = await prefs.getInt(counterKey);
    final savedDarkMode = await prefs.getBool(darkModeKey);

    setState(() {
      name = savedName ?? 'Guest';
      city = savedCity ?? 'Almaty';
      counter = savedCounter ?? 0;
      isDarkMode = savedDarkMode ?? false;

      nameController.text = name;
      cityController.text = city;

      isLoading = false;
      message = 'Saved data loaded';
    });
  }

  Future<void> saveProfile() async {
    final newName = nameController.text.trim();
    final newCity = cityController.text.trim();

    if (newName.isEmpty || newCity.isEmpty) {
      setState(() {
        message = 'Name and city cannot be empty';
      });
      return;
    }

    await prefs.setString(nameKey, newName);
    await prefs.setString(cityKey, newCity);

    setState(() {
      name = newName;
      city = newCity;
      message = 'Profile saved';
    });
  }

  Future<void> increaseCounter() async {
    counter++;

    await prefs.setInt(counterKey, counter);

    setState(() {
      message = 'Counter saved: $counter';
    });
  }

  Future<void> decreaseCounter() async {
    counter--;

    await prefs.setInt(counterKey, counter);

    setState(() {
      message = 'Counter saved: $counter';
    });
  }

  Future<void> resetCounter() async {
    counter = 0;

    await prefs.setInt(counterKey, counter);

    setState(() {
      message = 'Counter reset';
    });
  }

  Future<void> toggleDarkMode(bool value) async {
    await prefs.setBool(darkModeKey, value);

    setState(() {
      isDarkMode = value;
      message = isDarkMode ? 'Dark mode saved' : 'Light mode saved';
    });
  }

  Future<void> clearSavedData() async {
    await prefs.remove(nameKey);
    await prefs.remove(cityKey);
    await prefs.remove(counterKey);
    await prefs.remove(darkModeKey);

    setState(() {
      name = 'Guest';
      city = 'Almaty';
      counter = 0;
      isDarkMode = false;

      nameController.text = name;
      cityController.text = city;

      message = 'All saved data cleared';
    });
  }

  @override
  void dispose() {
    nameController.dispose();
    cityController.dispose();
    super.dispose();
  }

  Widget buildProfileCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Icon(
              Icons.person,
              size: 70,
            ),

            const SizedBox(height: 12),

            Text(
              name,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 6),

            Text(
              city,
              style: const TextStyle(fontSize: 20),
            ),

            const SizedBox(height: 20),

            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
                hintText: 'Enter your name',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person_outline),
              ),
            ),

            const SizedBox(height: 12),

            TextField(
              controller: cityController,
              decoration: const InputDecoration(
                labelText: 'City',
                hintText: 'Enter your city',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.location_city),
              ),
            ),

            const SizedBox(height: 12),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: saveProfile,
                child: const Text('Save Profile'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCounterCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Icon(
              Icons.exposure_plus_1,
              size: 70,
            ),

            const SizedBox(height: 12),

            const Text(
              'Saved Counter',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            Text(
              '$counter',
              style: const TextStyle(
                fontSize: 60,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 16),

            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: decreaseCounter,
                    child: const Text('-'),
                  ),
                ),

                const SizedBox(width: 10),

                Expanded(
                  child: ElevatedButton(
                    onPressed: increaseCounter,
                    child: const Text('+'),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),

            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: resetCounter,
                child: const Text('Reset Counter'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSettingsCard() {
    return Card(
      child: SwitchListTile(
        value: isDarkMode,
        onChanged: toggleDarkMode,
        title: const Text('Dark Mode'),
        subtitle: const Text('Saved with SharedPreferences'),
        secondary: Icon(
          isDarkMode ? Icons.dark_mode : Icons.light_mode,
        ),
      ),
    );
  }

  Widget buildMessageCard() {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.info),
        title: const Text('Status'),
        subtitle: Text(message),
      ),
    );
  }

  Widget buildBody() {
    if (isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        buildProfileCard(),

        const SizedBox(height: 12),

        buildCounterCard(),

        const SizedBox(height: 12),

        buildSettingsCard(),

        const SizedBox(height: 12),

        buildMessageCard(),

        const SizedBox(height: 12),

        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            onPressed: clearSavedData,
            icon: const Icon(Icons.delete),
            label: const Text('Clear Saved Data'),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter 30',
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.light,
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark,
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter 30: SharedPreferences'),
        ),
        body: buildBody(),
      ),
    );
  }
}