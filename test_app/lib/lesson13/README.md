# Lesson 13: BottomNavigationBar and Multi-Page State

## Folder topic

This lesson introduces `BottomNavigationBar` and builds an app with three main sections: Home, Tasks, and Profile. The selected tab changes the body of the `Scaffold` without opening a new route.

The main topic is tab-based navigation with shared state. The same `StatefulWidget` owns the selected tab and the task list, so multiple views can read and update the same data.

## Files explained

- `problem13.dart` defines a simple `Task` model and a `MainPage` stateful screen. It stores `selectedIndex`, a task controller, and a list of tasks. It has separate helper methods for building the home page, tasks page, and profile page.

## Key concepts

`selectedIndex` controls which tab is active. The `BottomNavigationBar` receives `currentIndex: selectedIndex`, and `onTap` calls `changeTab(index)` to update it with `setState()`.

`getCurrentPage()` chooses which widget to return based on the selected index. `getCurrentTitle()` does the same for the app bar title. This keeps the `build()` method easier to read.

The Tasks tab reuses ideas from previous lessons: a text field, adding tasks, checkboxes, delete buttons, and `ListView.builder`. The Home tab summarizes the number of tasks. The Profile tab shows static profile information. Together, these sections show how one state object can support several screens inside a tab layout.

