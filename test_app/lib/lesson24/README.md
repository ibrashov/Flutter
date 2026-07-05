# Lesson 24: Provider State Management

## Folder topic

This lesson introduces the `provider` package for state management. The app keeps posts, loading state, messages, and total count inside a `ChangeNotifier` instead of storing all state directly in the screen.

The main topic is shared state through the widget tree. Provider lets screens read and update state without manually passing every value and callback through constructors.

## Files explained

- `main.dart` wraps the app in `ChangeNotifierProvider` and creates `PostProvider` with a `PostRepo` and `PostService`.
- `models/post.dart` defines the `Post` model with JSON conversion.
- `services/post_service.dart` handles HTTP requests.
- `repo/post_repo.dart` adds validation and filtering rules above the service layer.
- `providers/post_providers.dart` defines `PostProvider`, which owns `_posts`, `_isLoading`, `_message`, getters, and async actions for loading, creating, and deleting posts.
- `screens/post_page.dart` builds the UI with `Consumer<PostProvider>`, `context.watch()`, and `context.read()`.

## Key concepts

`ChangeNotifier` is a class that can notify listeners when its data changes. `PostProvider` calls `notifyListeners()` after changing loading state, messages, or the post list.

`context.read<PostProvider>()` is used when the code wants to call an action without rebuilding from that value. `context.watch<PostProvider>()` is used when the widget should rebuild when provider data changes. `Consumer<PostProvider>` rebuilds only the widget subtree inside its builder.

The data flow is layered: UI calls provider, provider calls repository, repository calls service, service calls the API, and the result returns back up to update the UI.

