# Lesson 30: SharedPreferences for Simple Local Storage

## Folder topic

This lesson introduces local persistence with `shared_preferences`. The app saves a profile name, city, counter value, and dark mode setting so they remain available after the app restarts.

The main topic is key-value storage. `SharedPreferences` is useful for small simple values such as settings, flags, counters, and basic profile fields.

## Files explained

- `main.dart` defines `SharedPreferencesPracticeApp`. The state owns `SharedPreferencesAsync`, text controllers, storage keys, saved values, loading state, and methods for loading, saving, updating, toggling, resetting, and clearing data.

## Key concepts

The code uses constant keys such as `nameKey`, `cityKey`, `counterKey`, and `darkModeKey`. Keys are the names used to store and read values from local storage.

`loadSavedData()` reads saved strings, integers, and booleans. If a value does not exist, the app uses defaults like `Guest`, `Almaty`, `0`, and `false`.

Each update method writes to preferences first, then updates the UI state. For example, `increaseCounter()` increments the counter, saves it with `prefs.setInt()`, and updates the message. The theme mode is also saved, so the selected light or dark mode can be restored later.

