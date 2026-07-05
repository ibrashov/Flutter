# Lesson 12: Task Model, Checkboxes, and Completed State

## Folder topic

This lesson improves the ToDo idea by creating a real `Task` model. Each task has a title, description, and completion status. The user can add tasks, mark them as done, delete them, and clear completed tasks.

The main topic is object-based state. Instead of storing only strings, the app stores objects with multiple fields. This makes the UI more expressive and closer to real app data.

## Files explained

- `problem12.dart` defines a `Task` class and a `TaskPage`. The page stores `List<Task> tasks`, two text controllers, and methods for adding, toggling, removing, and clearing completed tasks. It also calculates `completedCount` with a getter.

## Key concepts

The `Task` class groups related task data: `title`, `description`, and `isDone`. This lets each list item show a title, a subtitle, and a checkbox.

The `completedCount` getter uses `where()` to filter only completed tasks and then reads `.length`. This shows how Dart collection methods can calculate derived state from the main list.

The checkbox uses `value: task.isDone` and calls `toggleTask()` when changed. The title text uses `TextDecoration.lineThrough` when the task is done. This connects data state to visual style, which is one of the main strengths of declarative Flutter UI.

The `clearTask()` method uses `removeWhere()` to remove only completed tasks. This is more advanced than clearing the whole list because it applies a condition to each item.

