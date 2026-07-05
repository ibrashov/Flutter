# Lesson 1: Dart Basics and First Flutter Screen

## Folder topic

This lesson introduces the first two important layers of Flutter development: Dart language basics and the smallest possible Flutter app structure. The Dart file shows how simple values, collections, conditions, functions, null safety, and asynchronous functions work. The Flutter file then uses those beginner concepts inside a visual application with text, layout, and a button.

The main idea is that Flutter apps are written in Dart. Before building complex screens, you need to understand how Dart stores values, repeats actions, checks conditions, and returns data from functions.

## Files explained

- `lesson1.dart` is a Dart practice file. It demonstrates `main()`, a `for` loop, `print()`, `String`, `bool`, `var`, `final`, `const`, `int`, string interpolation, `List<String>`, `Map<String, String>`, `if/else`, simple functions, nullable values with `String?`, and an async `Future<String>` function.
- `problem1.dart` is the first Flutter UI example. It runs `MyApp`, builds a `MaterialApp`, uses a `Scaffold` with an `AppBar`, centers a `Column`, displays several `Text` widgets, adds spacing with `SizedBox`, and handles a button click with `ElevatedButton`.

## Key concepts

`main()` is the entry point of a Dart or Flutter program. In a console-style Dart file, it can directly run loops and print values. In a Flutter file, it calls `runApp()` to start rendering widgets on the screen.

Variables store data. `var` lets Dart infer the type, `final` creates a value that can be assigned once at runtime, and `const` creates a compile-time constant. Lists store ordered items, while maps store key-value data such as a person's name, age, and city.

Flutter UI is built from widgets. `MaterialApp` configures the app, `Scaffold` provides the page structure, `AppBar` creates the top bar, and `Column` places widgets vertically. The button callback shows the first example of user interaction.

