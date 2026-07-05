# Lesson 2: Dart Data Inside a Flutter UI

## Folder topic

This lesson connects Dart variables, functions, lists, and maps to visible Flutter widgets. Instead of only printing values in the console, the app displays the values on the screen and also prints them when a button is pressed.

The main topic is dynamic text in Flutter. The UI is still simple, but it is no longer only hard-coded text. The screen reads values from Dart variables and uses string interpolation to show name, age, city, country, and skills.

## Files explained

- `problem2.dart` contains the full app. It defines a helper function `getGreeting(String name)`, creates local variables inside `build()`, stores skills in a `List<String>`, stores personal information in a `Map<String, String>`, and builds a profile-like page with `Text`, `Padding`, `Column`, `SizedBox`, and `ElevatedButton`.

## Key concepts

The helper function `getGreeting()` shows how functions keep repeated logic separate from UI code. The function receives a name and returns a formatted greeting string.

The `skills` list is used by index, for example `skills[0]`, to display each skill. The `person` map is used by key, for example `person['city']`, to display named pieces of data. These two collection types are common in Flutter because apps often work with lists of items and structured objects.

`Padding` gives the content breathing room around the screen edges. `Column` arranges the information vertically, and `crossAxisAlignment: CrossAxisAlignment.start` aligns the text to the left. The `ElevatedButton` uses an `onPressed` callback to print the current data, which demonstrates how UI events can access Dart variables.

