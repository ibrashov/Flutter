# Lesson 21: Full CRUD API Practice

## Folder topic

This lesson practices the main HTTP operations used in CRUD apps: GET, PUT, PATCH, and DELETE. The app loads one post, lets the user edit fields, updates the post with full or partial updates, and deletes it.

The main topic is understanding how different HTTP methods represent different intentions: reading, replacing, partially changing, and removing data.

## Files explained

- `problem21.dart` defines an `ApiPost` model and a `CrudPage`. The page has text controllers for title and body, loading and message state, and separate async methods for `fetchPost()`, `updatePostWithPut()`, `updatePostWithPatch()`, and `deletePost()`.

## Key concepts

GET requests read data. In this lesson, `fetchPost()` requests post `1`, decodes the JSON response, stores it in `post`, and fills the text controllers with the loaded title and body.

PUT requests usually replace a whole resource. The code sends `id`, `title`, `body`, and `userId` in the JSON body. PATCH requests usually update only part of a resource. The code sends only the title.

DELETE removes a resource. After a successful delete response, the app clears the current post and the text fields. The UI also has a `clearScreen()` method for resetting the local screen state without making an API request.

The page separates display into helper methods such as `buildPostCard()` and `buildActionButtons()`. This makes a long CRUD screen easier to understand.

