# Lesson 16: Splitting a Flutter Project Into Folders

## Folder topic

This lesson reorganizes the task manager into multiple files and folders. It separates the app entry point, data model, screen, and reusable widget.

The main topic is project structure. As apps grow, keeping all code in one file becomes hard to read. Splitting code by responsibility makes the project easier to understand, test, and extend.

## Files explained

- `main.dart` starts the app, creates `MaterialApp`, and sets `TaskPage` as the home screen.
- `models/task.dart` defines the `Task` data model with `title`, `description`, and `isDone`.
- `screens/task_page.dart` owns the task list state, text controllers, task actions, counters, and main page layout.
- `widgets/task_card.dart` defines a reusable `TaskCard` widget that displays one task with a checkbox, title, description, and delete button.

## Key concepts

The `models` folder stores data classes. The `screens` folder stores full pages. The `widgets` folder stores smaller reusable UI pieces. This separation makes each file responsible for one kind of work.

`TaskPage` passes data and callbacks into `TaskCard`. The card does not modify the list directly. Instead, it calls `onChanged` or `onDelete`, and the parent page decides what should happen. This parent-owned state pattern is very common in Flutter.

This lesson also keeps the task manager features from previous lessons: adding tasks, toggling completion, deleting tasks, clearing completed tasks, and showing total and completed counts.

