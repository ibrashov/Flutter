# Lesson 18: Using External Packages

## Folder topic

This lesson introduces Flutter packages, using `google_fonts` as the main example. The app applies a Poppins text theme and displays a list of common packages such as `http`, `shared_preferences`, and `provider`.

The main topic is extending Flutter with dependencies. Packages let you use ready-made solutions instead of building every feature from zero.

## Files explained

- `problem18.dart` imports `package:google_fonts/google_fonts.dart`, creates a `ThemeData` with `GoogleFonts.poppinsTextTheme()`, and uses `GoogleFonts.poppins()` for specific text widgets. It also maps a list of package names into cards.

## Key concepts

Packages are declared in `pubspec.yaml` and then imported into Dart files. In this lesson, `google_fonts` provides font helpers that remove the need to manually download and register font files.

The app uses spread syntax with `...packages.map(...)` to convert a list of strings into a list of widgets. This is a powerful Flutter pattern because lists of data can become lists of UI elements.

The `showMessage()` helper uses `ScaffoldMessenger` to show a `SnackBar` when a package row or test button is pressed. This gives user feedback without changing the main page.

