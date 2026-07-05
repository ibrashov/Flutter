# Lesson 5: Stateful Counter App

## Folder topic

This lesson introduces `StatefulWidget` and `setState()`. The app is a simple counter with increase, decrease, and reset buttons. It also shows a message that changes after each action.

The main topic is local UI state. A stateless widget can display information, but it cannot remember changing values by itself. A stateful widget stores values in a `State` class and rebuilds the UI when those values change.

## Files explained

- `problem5.dart` defines `MyApp`, `CounterPage`, and `_CounterPageState`. The state stores an integer `counter` and a string `message`. The methods `increaseCounter()`, `decreaseCounter()`, and `resetCounter()` update state and trigger rebuilds with `setState()`.

## Key concepts

`StatefulWidget` is used when the screen needs to change while the app is running. The visible page is `CounterPage`, but the changing data lives in `_CounterPageState`.

`setState()` tells Flutter that something changed and that the widget should be rebuilt. Inside `setState()`, the code updates `counter` and `message`. After the rebuild, the `Text` widgets display the new values.

The button row uses `Expanded` so each button shares the available horizontal space. This lesson is small, but it is one of the most important steps in Flutter because most interactive apps need state: counters, forms, selected tabs, loaded data, settings, and user actions all depend on state changes.

