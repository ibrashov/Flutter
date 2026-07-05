# Lesson 11: Simple ToDo List With Dynamic Items

## Folder topic

This lesson creates a basic ToDo list where the user can add tasks, remove individual tasks, and clear all tasks. It combines text input, local state, and dynamic list rendering.

The main topic is managing a changing `List<String>` in a `StatefulWidget`. The UI is rebuilt whenever the list changes, so the screen always reflects the current tasks.

## Files explained

- `problem11.dart` defines `ToDoPage`. It owns a `TextEditingController`, a `List<String> tasks`, and methods for `addTask()`, `removeTask(int index)`, and `clearAllTasks()`. The page uses `ListView.builder` to display the current task list.

## Key concepts

The `addTask()` method reads and trims the text field value. If the text is empty, it returns early. This prevents blank tasks from being added. If the text is valid, it adds the task to the list and clears the controller inside `setState()`.

`removeTask(index)` uses `removeAt(index)` to delete the task at the selected position. The delete icon inside each `ListTile` calls this method with the current index from `ListView.builder`.

The page also handles the empty state. When `tasks.isEmpty`, it shows `No tasks yet`; otherwise it shows the list. This is a common UI pattern: loading state, empty state, error state, and content state are all important in real apps.

