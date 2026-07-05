# Lesson 17: Assets, Images, and Icons

## Folder topic

This lesson introduces local assets in Flutter. The app displays a profile image and an icon from project asset folders, then explains the role of `pubspec.yaml` in registering those assets.

The main topic is using files that are bundled with the app. Images and icons must be placed in the project and listed in `pubspec.yaml` before Flutter can load them reliably.

## Files explained

- `problem/main.dart` creates `AssetPracticeApp` and `AssetHomePage`. It uses `CircleAvatar` with `AssetImage('assets/images/profile.png')`, `Image.asset('assets/icons/flutter_logo.png')`, and an `errorBuilder` fallback icon if the image cannot load.

## Key concepts

`AssetImage` is an image provider. It is commonly used in widgets like `CircleAvatar`, `DecorationImage`, or `Image`. `Image.asset()` is a direct widget for displaying an asset image.

The `errorBuilder` in `Image.asset` is a useful safety feature. If the asset path is wrong or the image cannot be decoded, the UI can show a fallback widget instead of failing silently.

Assets are configured in `pubspec.yaml` under the `flutter.assets` section. This project registers `assets/images/` and `assets/icons/`, which makes the profile image and Flutter logo available to the app.

