# Lesson 23: Repository Pattern

## Folder topic

This lesson adds a repository layer between the UI and the service. The service talks to the API, while the repository applies app-specific rules such as cleaning input, validating fields, and filtering posts.

The main topic is the repository pattern. A repository gives the UI a simpler interface and hides where the data comes from or how it is cleaned.

## Files explained

- `main.dart` starts `RepositoryPracticeApp` and opens `PostsPage`.
- `models/post.dart` defines the `Post` model. This file also currently contains an extra copied `PostsPage` implementation, but the app entry point uses `screens/posts_page.dart` for the main flow.
- `services/post_services.dart` contains raw API operations for fetching, creating, and deleting posts.
- `repo/post_repository.dart` wraps `PostService`. It filters invalid posts, trims title and body input, validates empty values, and rethrows errors with repository context.
- `screens/posts_page.dart` builds the UI and uses `PostRepository` instead of calling `PostService` directly.

## Key concepts

The service layer knows HTTP details: URLs, status codes, headers, request bodies, and JSON decoding. The repository layer knows app rules: what data is acceptable and what errors should mean for the app.

`PostsPage` creates a `PostRepository` in `initState()` and then calls `getPosts()`, `addPost()`, and `removePost()`. This keeps the UI cleaner because it does not need to know how the service is implemented.

The repository pattern becomes more useful as an app grows. Later, the same repository could switch from remote API data to cached data, local database data, or test data without forcing the screen to change much.

