# Lesson 27: FutureBuilder With API Data

## Folder topic

This lesson uses `FutureBuilder` to display API data. The app fetches posts from JSONPlaceholder, shows loading and error states, and opens a details page for a selected post.

The main topic is connecting a `Future` directly to UI. `FutureBuilder` watches the current state of an asynchronous operation and rebuilds when the operation completes.

## Files explained

- `main.dart` defines a `Post` model, `PostService`, `PostsPage`, and `PostDetailsPage`. `PostService` handles fetching all posts and fetching one post by id. `PostsPage` stores a `Future<List<Post>>`, and `PostDetailsPage` uses a `FutureBuilder<Post>`.

## Key concepts

`postsFuture` is created in `initState()` so the API call starts when the page is created. The refresh button replaces `postsFuture` with a new future and calls `setState()`, causing `FutureBuilder` to run again.

`FutureBuilder` gives a `snapshot`. The code checks `snapshot.connectionState`, `snapshot.hasError`, and `snapshot.hasData` to decide whether to show loading, error, empty, or list UI.

The details page demonstrates the same pattern for a single object. It receives `postId`, creates a future with `fetchPostById(postId)`, and renders the post after the future completes.

