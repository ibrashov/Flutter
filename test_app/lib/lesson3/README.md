# Lesson 3: Profile Layout With Cards and Icons

## Folder topic

This lesson focuses on building a basic profile screen. The code uses common Material widgets to create a personal information page with an avatar, name, contact cards, a skills section, and action buttons.

The important idea is layout composition. Flutter screens are created by combining many small widgets: icons, text, rows, columns, cards, padding, and buttons. Each widget solves a small part of the page.

## Files explained

- `problem3.dart` creates a profile UI for Anuar. It uses `CircleAvatar` for the profile icon, `Card` widgets for location and email information, `Row` to place icons beside text, a `List<String>` for skills, and two `ElevatedButton` widgets for actions.

## Key concepts

`CircleAvatar` is commonly used for user images or profile placeholders. In this lesson it contains an `Icons.person` icon, which is a simple way to build a profile header before using real image assets.

`Card` gives information a separate visual container. Inside each card, `Padding` creates inner spacing and `Row` places the icon and text horizontally. This pattern is useful for profile details, settings rows, contact information, and dashboard items.

The screen also practices alignment. `Center` places important profile elements in the middle, while the main `Column` uses `crossAxisAlignment: CrossAxisAlignment.start` so the skills section begins from the left. The buttons demonstrate simple user actions through `onPressed` callbacks that print messages.

