# Lesson 14: Drawer Navigation and AppBar Actions

## Folder topic

This lesson introduces a navigation drawer. Instead of using bottom tabs, the app opens a side menu that lets the user switch between Home, Task, Profile, and Settings pages.

The main topic is drawer-based navigation inside one `Scaffold`. A drawer is useful when an app has several main sections and you do not want all of them visible at the bottom of the screen.

## Files explained

- `problem14.dart` defines a `MenuPage` data class and `MainDrawerPage`. The state stores `selectedIndex`, a list of drawer pages, helper methods for each page body, a `buildDrawer()` method, and app bar actions for search and notifications.

## Key concepts

`Drawer` is placed in the `Scaffold.drawer` property. It contains a `ListView` with a `UserAccountsDrawerHeader` and several `ListTile` items. Each item calls `changePage(index)`, which updates `selectedIndex` and then closes the drawer with `Navigator.pop(context)`.

The list of `MenuPage` objects stores a title and icon for each menu item. This is a small example of using model data to build navigation structure.

The settings page uses `SwitchListTile` for boolean options such as notifications and dark mode. The app also uses `ScaffoldMessenger.of(context).showSnackBar()` to show short feedback messages when drawer items or app bar icons are pressed.

