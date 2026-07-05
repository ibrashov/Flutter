# Lesson 29: StreamController and Manual Stream Events

## Folder topic

This lesson uses `StreamController` to manually push values and errors into a stream. The app is a counter where button presses add new stream events.

The main topic is controlling a stream yourself. Instead of generating values automatically with `async*`, the code decides exactly when to emit data or an error.

## Files explained

- `main.dart` defines `StreamControllerApp` and `StreamControllerPage`. The state owns a `StreamController<int>`, a local `counter`, and methods for increasing, decreasing, resetting, adding an error, and closing the controller.

## Key concepts

`StreamController<int>` creates a stream that can receive integer events. Calling `counterController.add(counter)` sends the latest counter value to every listener.

`StreamBuilder<int>` listens to `counterController.stream`. It uses `initialData: counter` so the UI has a value before the first stream event. If the stream receives an error through `addError()`, the builder displays the error UI.

Closing the controller in `dispose()` is important. A stream controller owns resources, and leaving it open after the page is removed can cause memory leaks or runtime problems.

