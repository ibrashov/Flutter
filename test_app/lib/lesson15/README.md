# Lesson 15: Light and Dark Themes

## Folder topic

This lesson teaches app-wide theming with `ThemeData`, `ColorScheme`, `ThemeMode`, and a dark mode switch. The UI changes between light and dark themes when the user toggles a `SwitchListTile`.

The main topic is separating design rules from individual widgets. Instead of styling every widget manually, the app defines a light theme and a dark theme, then lets Flutter apply those styles across the UI.

## Files explained

- `problem15.dart` defines `ThemePracticeApp` as a `StatefulWidget`. It stores `isDarkMode`, builds separate light and dark themes, and passes the current theme state to `ThemeHomePage`. The home page shows theme-aware cards, text, fields, buttons, and snack bars.

## Key concepts

`ThemeData` configures the visual language of the app. This lesson customizes brightness, seed color, app bar alignment, card shape, button shape, and input decoration borders.

`theme`, `darkTheme`, and `themeMode` work together. `theme` is used for light mode, `darkTheme` is used for dark mode, and `themeMode` decides which one is active.

`Theme.of(context)` reads the current theme from the widget tree. The code uses `Theme.of(context).colorScheme.primary` and `Theme.of(context).textTheme` so the UI automatically adapts when the theme changes. This is the correct direction for scalable Flutter design.

