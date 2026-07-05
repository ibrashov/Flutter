# Lesson 28: StreamBuilder With an Async Counter Stream

## Folder topic

This lesson introduces `StreamBuilder`. The app creates a stream that emits numbers from 1 to 20 with a one-second delay between each value.

The main topic is listening to multiple asynchronous values over time. A `Future` completes once, but a `Stream` can produce many values.

## Files explained

- `main.dart` defines `StreamBuilderApp` and `StreamHomePage`. The state creates `counterStream`, defines `createCounterStream()` with `async*` and `yield`, restarts the stream, and displays stream values through `StreamBuilder<int>`.

## Key concepts

`async*` creates an asynchronous generator function. Inside the loop, the code waits one second with `Future.delayed()` and then emits the next number with `yield`.

`StreamBuilder` listens to the stream and rebuilds whenever a new number arrives. If there is no data yet, it shows a loading indicator. If an error appears, it shows an error widget. When data exists, it shows the counter UI.

The refresh button calls `restartStream()`, which assigns a new stream and rebuilds the widget. This restarts the sequence from the beginning.

