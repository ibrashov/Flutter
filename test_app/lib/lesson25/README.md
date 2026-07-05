# Lesson 25: MultiProvider, Counter State, and Theme State

## Folder topic

This lesson uses `MultiProvider` to provide more than one state object to the app. One provider manages a counter, and another provider manages light or dark theme mode.

The main topic is multiple independent app states. Real apps often need separate state objects for authentication, theme, user settings, counters, carts, API data, and more.

## Files explained

- `main.dart` creates a `MultiProvider` with `CounterProvider` and `ThemeProvider`. It reads `ThemeProvider` to choose the app `themeMode`.
- `providers/count_provider.dart` defines `CounterProvider` with `increase()`, `decrease()`, `reset()`, and `addFive()`.
- `providers/theme_provider.dart` defines `ThemeProvider`, stores `_isDarkMode`, exposes `themeMode`, and updates theme state with `toggleTheme()`.
- `screens/home_page.dart` displays the current counter and theme, then navigates to the counter and settings pages.
- `screens/settings_page.dart` uses `SwitchListTile` to toggle dark mode through `ThemeProvider`.
- `screens/count_page.dart` currently contains a second home-style screen with similar navigation and provider reads. The app's main import points to `screens/home_page.dart`.

## Key concepts

`MultiProvider` keeps provider setup clean when more than one `ChangeNotifierProvider` is needed. Each provider owns its own state and calls `notifyListeners()` when that state changes.

The app theme is controlled at the top level. Because `MaterialApp` reads `themeMode` from `ThemeProvider`, changing the switch in the settings page can rebuild the app with the correct light or dark theme.

The counter state can be read from different screens because the provider is above those screens in the widget tree. This is the main benefit of provider compared with keeping state only inside one page.

