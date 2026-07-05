# Lesson 19: HTTP GET, JSON Decoding, and Loading State

## Folder topic

This lesson introduces calling an API with the `http` package. The app fetches posts from JSONPlaceholder, converts JSON data into Dart objects, and displays the posts in a list.

The main topic is asynchronous API loading. Network requests take time and can fail, so the UI needs loading, error, empty, and success states.

## Files explained

- `problem19.dart` defines a `Post` model, a `Post.fromJson()` factory constructor, and a `PostPage` stateful screen. The screen calls `http.get()`, decodes the response with `jsonDecode()`, maps JSON objects into `Post` objects, and renders them with `ListView.builder`.

## Key concepts

`Future<void> fetchPost()` is asynchronous. It sets `isLoading` to true before the request, then updates the UI after the response arrives. If the status code is `200`, the response body is decoded. If the status is not successful or an exception happens, an error message is shown.

`jsonDecode(response.body)` converts a JSON string into Dart data. Because the endpoint returns a list, the code treats it as `List<dynamic>` and maps each item into `Post.fromJson(item)`.

The `buildBody()` method separates UI states. It returns a progress indicator while loading, an error text when there is an error, an empty message when there are no posts, and a list when posts exist.

