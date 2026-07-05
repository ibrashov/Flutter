# Lesson 10: ListView.builder and Detail Pages

## Folder topic

This lesson introduces model-based list rendering with `ListView.builder`. The app displays a list of courses and opens a detail page when the user taps a course.

The main topic is converting a list of Dart objects into a scrollable Flutter UI. This is a core pattern in Flutter because apps often show lists of users, posts, products, messages, lessons, or settings.

## Files explained

- `problem10.dart` defines a `Course` model with `title`, `description`, `lessons`, and `icon`. `CoursesPage` stores a constant list of courses and renders them with `ListView.builder`. `CourseDetailsPage` receives one `Course` object and shows its information on a separate page.

## Key concepts

The `Course` class groups related data into one object. This is cleaner than keeping separate lists for titles, descriptions, lesson counts, and icons.

`ListView.builder` builds only the visible list items and is better for long lists than manually writing every widget. The `itemCount` controls how many rows exist, and `itemBuilder` receives the current `index`.

Each list item is a `Card` containing a `ListTile`. `ListTile` is useful for common row layouts because it supports `leading`, `title`, `subtitle`, `trailing`, and `onTap`. When tapped, the app passes the selected course to `CourseDetailsPage`, which demonstrates object-based navigation.

