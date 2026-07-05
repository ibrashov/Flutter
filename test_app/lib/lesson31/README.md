# Lesson 31: Saving a List as Local JSON

## Folder topic

This lesson stores a full list of tasks locally by converting it to JSON. Unlike lesson 30, which saves simple values one by one, this lesson saves structured objects.

The main topic is serialization. Serialization means converting Dart objects into a format that can be stored, such as JSON. Deserialization means converting the stored JSON back into Dart objects.

## Files explained

- `main.dart` defines the `Task` model, JSON methods, `copyWith()`, the app widget, and the full `TasksPage`. The page can load tasks, save tasks, add tasks, toggle completion, delete tasks, clear all tasks, and calculate task statistics.

## Key concepts

`Task.toJson()` converts one task into a map. `Task.fromJson()` creates a task from a map. The app maps the whole task list into a list of maps, then uses `jsonEncode()` to create one JSON string for storage.

`loadTasks()` reads the saved JSON string from `SharedPreferencesAsync`. If nothing is saved yet, it starts with an empty list. If JSON exists, it decodes the string with `jsonDecode()` and converts each item into a `Task`.

`copyWith()` is useful because the `Task` fields are final. Instead of changing a task directly, the app creates a new task with the same values except the updated `isDone` value. This is a clean pattern for immutable data.

The UI includes a form, stats card, status card, task cards, and a clear-all button. It demonstrates a complete local CRUD flow without a remote API.

