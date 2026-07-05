# Lesson 4: More Advanced Layout With Row, Wrap, Expanded, and Scroll

## Folder topic

This lesson builds a larger profile layout and introduces more flexible layout tools. The screen contains a profile header, statistic boxes, a skills area, and two full-width action buttons.

The main topic is responsive layout thinking. Instead of placing everything one after another, this lesson uses `Row`, `Expanded`, `Wrap`, `Container`, and `SingleChildScrollView` to control how content shares space and how it behaves when the screen becomes crowded.

## Files explained

- `problem4.dart` contains the full layout. It defines a reusable helper method `buildSkillBox(String text)` that returns a styled `Container`. The page uses a profile row, statistic cards, a wrapped skills list, and action buttons for follow and message behavior.

## Key concepts

`Row` arranges widgets horizontally. `Expanded` tells a child inside a row to take the available space. This is used for the profile text beside the avatar, for statistic boxes, and for the buttons.

`Wrap` is useful when you have multiple small items, such as skill tags. Unlike a `Row`, which can overflow if there is not enough width, `Wrap` can move items to the next line using `spacing` and `runSpacing`.

`SingleChildScrollView` allows the content to scroll if it becomes taller than the screen. This is important for layouts with many sections. The helper method `buildSkillBox()` also introduces the idea of reusable widget-building functions, which helps avoid repeating the same `Container` styling many times.

