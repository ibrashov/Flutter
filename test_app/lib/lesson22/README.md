# Lesson 22: API Service Layer

## Folder topic

This lesson moves API code into a separate service class. The app still loads, creates, and deletes posts, but the HTTP logic is no longer written directly inside the screen.

The main topic is separation of concerns. The screen should focus on UI and user interaction, while the service should focus on network requests and JSON conversion.

## Files explained

- `main.dart` starts `ServicePracticeApp`, configures the Material theme, and opens `PostsPage`.
- `models/post.dart` defines the `Post` model with `fromJson()` and `toJson()` methods.
- `services/post_service.dart` contains `PostService`, which handles `fetchPosts()`, `fetchPostById()`, `createPost()`, `updatedPost()`, and `deletedPost()`.
- `screens/posts_page.dart` owns UI state, controllers, messages, loading state, and the visible list of posts. It calls methods from `PostService`.

## Key concepts

The service layer is responsible for talking to the API. It uses `http.get`, `http.post`, `http.put`, and `http.delete`, checks status codes, decodes JSON, and throws exceptions when something fails.

The model layer defines how API data becomes Dart data. `Post.fromJson()` reads fields from a map, and `toJson()` converts a `Post` back into a map.

The screen layer calls the service and reacts to results. If loading succeeds, it updates the post list. If an exception is thrown, it shows an error message. This structure is easier to maintain than putting API code, JSON code, and UI code all in one file.

