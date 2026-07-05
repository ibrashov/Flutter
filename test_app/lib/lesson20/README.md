# Lesson 20: HTTP POST and Creating Data

## Folder topic

This lesson teaches how to send data to an API with an HTTP POST request. The user enters a title and body, the app sends them as JSON, and the response is displayed as a created post.

The main topic is request bodies and server responses. GET reads data from an API, while POST sends new data to an API.

## Files explained

- `problem20.dart` defines a `CreatedPost` model and a `CreatePostPage`. The page uses two text controllers, validates that title and body are not empty, sends a POST request to JSONPlaceholder, and shows the returned created post in a card.

## Key concepts

`http.post()` sends data to a server. The code sets the `Content-Type` header to JSON and uses `jsonEncode()` to convert a Dart map into a JSON string.

The expected success status for creating a resource is `201 Created`. When the response status is `201`, the app decodes the response and builds a `CreatedPost` object from it.

The UI uses `isLoaded` to switch between buttons and a `CircularProgressIndicator`. This prevents the user from thinking nothing is happening while the request is in progress. The lesson also includes `clearForm()` and controller disposal, keeping the form lifecycle clean.

