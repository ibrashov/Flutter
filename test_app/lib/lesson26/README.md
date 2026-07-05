# Lesson 26: Provider Selector for Efficient Rebuilds

## Folder topic

This lesson introduces `Selector` from the provider package. The dashboard has three pieces of state: counter, username, and premium status. Each card listens only to the part of state it needs.

The main topic is reducing unnecessary widget rebuilds. In larger apps, rebuilding too much UI can make screens harder to debug and less efficient.

## Files explained

- `main.dart` provides `DashboardProvider` with `ChangeNotifierProvider` and opens `DashboardPage`.
- `providers/dashboard_provider.dart` stores `_counter`, `_username`, and `_isPremium`. It exposes getters and methods for increasing, decreasing, resetting, changing username, and toggling premium.
- `screens/dashboard_screen.dart` builds separate cards for counter, user, premium, and summary. Each card uses `Selector` to listen to selected provider values.

## Key concepts

`Selector<DashboardProvider, int>` listens only to `provider.counter`. If the username changes, the counter card does not need to rebuild. The same idea is used for username and premium status.

`context.read<DashboardProvider>()` is used inside button callbacks to call provider methods. This does not subscribe the button to state changes.

The summary card selects a combined string containing username, counter, and premium status. This means it rebuilds when any of those selected values changes. The print statements in the code are useful for learning which widgets rebuild after each action.

