# Lesson 8: Basic Navigation Between Pages

## Folder topic

This lesson introduces navigation with `Navigator.push()` and `Navigator.pop()`. The app has a home page with buttons that open a profile page and a settings page. Each child page can return to the previous screen.

The main topic is moving between screens. Flutter keeps pages on a navigation stack: pushing adds a new page on top, and popping removes the current page.

## Files explained

- `problem8.dart` defines `HomePage`, `ProfilePage`, and `SettingPage`. `HomePage` opens the other pages with `MaterialPageRoute`. `ProfilePage` and `SettingPage` use `Navigator.pop(context)` to go back.

## Key concepts

`Navigator.push()` is used to open a new screen. It needs a `BuildContext` and a route. `MaterialPageRoute` creates a page transition that follows Material Design behavior.

`Navigator.pop()` closes the current page and returns to the previous one. In this lesson, both the profile and settings screens include their own helper method `goBack()` to make the intent clear.

The settings page also introduces `ListTile` inside `Card` widgets for settings-style rows. Boolean values such as `notifications` and `darkMode` are displayed as `On` or `Off` using the ternary operator. This lesson prepares for later navigation examples where pages can also send data back.

