# Lesson 32: Storage Service Architecture

## Folder topic

This lesson improves lesson 31 by moving local storage logic into a separate service file. The app still saves tasks as JSON in `SharedPreferences`, but the screen no longer directly handles JSON encoding, decoding, or preference keys.

The main topic is separating persistence logic from UI logic. This creates a cleaner architecture and makes the code easier to reuse or replace later.

## Files explained

- `main.dart` starts `StorageServicePracticeApp`, configures the theme, and opens `TasksPage`.
- `models/task.dart` defines the `Task` model with `fromJson()`, `toJson()`, and `copyWith()`.
- `services/task_storage_service.dart` contains `TaskStorageService`, which loads tasks, saves tasks, and clears tasks using `SharedPreferencesAsync`.
- `screens/tasks_page.dart` owns the visible page state, text controllers, task list, loading state, messages, task actions, statistics, and UI widgets.

## Key concepts

`TaskStorageService` is responsible for persistence. It knows the storage key, reads the saved JSON string, decodes it, converts maps into `Task` objects, encodes task lists, and removes saved data.

`TasksPage` is responsible for user interaction. It validates text fields, creates new tasks, toggles completion with `copyWith()`, deletes tasks, updates messages, and calls the storage service after state changes.

This is a stronger structure than putting everything into one file. If the app later moves from `SharedPreferences` to a database, most UI code can stay the same while only the service changes.

